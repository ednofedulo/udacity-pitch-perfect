//
//  RecordSoundViewController+Audio.swift
//  PitchPerfect
//
//  Created by Edno Fedulo on 28/01/18.
//  Copyright © 2018 Fedulo. All rights reserved.
//

import UIKit
import AVFoundation

extension RecordSoundViewController : AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: audioRecorder.url)
        } else {
            showAlert(Utils.Alerts.RecordingFailedTitle, message: Utils.Alerts.RecordingFailedMessage)
        }
    }
    
    func setAudioFile(_ fileName: String) -> URL! {
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = fileName
        let pathArray = [dirPath, recordingName]
        return URL(string: pathArray.joined(separator: "/"))
    }
    
    func startRecording(){
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        let filePath = setAudioFile(fileName)
        
        try! audioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
    }
    
    func stopRecording() {
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
}
