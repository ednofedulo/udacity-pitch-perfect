//
//  RecordSoundViewController.swift
//  PitchPerfect
//
//  Created by Edno Fedulo on 23/01/18.
//  Copyright © 2018 Fedulo. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundViewController: UIViewController {

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
    
    func configureUI(_ recording: Bool){
        recordLabel.text = recording ? recordingText : tapToRecordText
        stopRecordButton.isEnabled = recording
        recordButton.isEnabled = !recording
    }

    @IBAction func recordAudio(_ sender: Any) {
        configureUI(true)
        startRecording()
    }
    
    @IBAction func stopRecordAudio(_ sender: Any) {
        configureUI(false)
        stopRecording()
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
