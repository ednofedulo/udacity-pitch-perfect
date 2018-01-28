//
//  PlaySoundsViewController.swift
//  PitchPerfect
//
//  Created by Edno Fedulo on 26/01/18.
//  Copyright © 2018 Fedulo. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    var recordedAudioURL: URL!

    @IBOutlet weak var snailButton: UIButton!
    @IBOutlet weak var chipmunkButton: UIButton!
    @IBOutlet weak var rabbitButton: UIButton!
    @IBOutlet weak var vaderButton: UIButton!
    @IBOutlet weak var echoButton: UIButton!
    @IBOutlet weak var reverbButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioFile: AVAudioFile!
    var audioEngine: AVAudioEngine!
    var audioPlayerNode: AVAudioPlayerNode!
    var stopTimer: Timer!
    
    struct AudioSettings {
        static let SlowRate : Float = 0.5
        static let FastRate : Float = 1.5
        static let HighPitch : Float = 1000
        static let LowPitch : Float = -1000
    }
    
    enum ButtonType: Int { case slow = 0, fast, chipmunk, vader, echo, reverb }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudio()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureUI(.notPlaying)
    }
    
    @IBAction func playSoundForButton(_ sender: UIButton) {
        switch(ButtonType(rawValue: sender.tag)!) {
        case .slow:
            playSound(rate: AudioSettings.SlowRate)
        case .fast:
            playSound(rate: AudioSettings.FastRate)
        case .chipmunk:
            playSound(pitch: AudioSettings.HighPitch)
        case .vader:
            playSound(pitch: AudioSettings.LowPitch)
        case .echo:
            playSound(echo: true)
        case .reverb:
            playSound(reverb: true)
        }
        
        configureUI(.playing)
    }
    
    @IBAction func stopButtonPressed(_ sender: AnyObject) {
        stopAudio()
    }

}
