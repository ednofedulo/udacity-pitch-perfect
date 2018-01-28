//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Edno Fedulo on 23/01/18.
//  Copyright © 2018 Fedulo. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!
    
    let fileName = "recordedVoice.wav"
    let recordingText = "Recording..."
    let tapToRecordText = "Tap to record"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI(false)
    }
    
    func startRecording() {
        recordLabel.text = recordingText
        stopRecordButton.isEnabled = true
        recordButton.isEnabled = false
    }
    
    func stopRecording() {
        recordLabel.text = tapToRecordText
        stopRecordButton.isEnabled = false
        recordButton.isEnabled = true
    }
    
    func configureUI(_ recording: Bool){
        if recording {
            startRecording()
        } else {
            stopRecording()
        }
    }

    @IBAction func recordAudio(_ sender: Any) {
        
        configureUI(true)
        
        let filePath = setAudioFile(fileName)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
    }
    
    func setAudioFile(_ fileName: String) -> URL! {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = fileName
        let pathArray = [dirPath, recordingName]
        return URL(string: pathArray.joined(separator: "/"))
    }
    
    @IBAction func stopRecordAudio(_ sender: Any) {
        
        configureUI(false)
        
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            showAlert(Utils.Alerts.RecordingFailedTitle, message: Utils.Alerts.RecordingFailedMessage)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording" {
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordedAudioURL = sender as! URL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
    }
    
    func showAlert(_ title: String, message: String) {
        let alert = Utils.createAlert(title, message: message)
        present(alert, animated: true, completion: nil)
    }
}

