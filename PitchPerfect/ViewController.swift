//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Edno Fedulo on 23/01/18.
//  Copyright © 2018 Fedulo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopRecordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        stopRecordButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        recordLabel.text = "Recording..."
        stopRecordButton.isEnabled = true
    }
    
    @IBAction func stopRecordAudio(_ sender: Any) {
        recordLabel.text = "Tap to record"
        stopRecordButton.isEnabled = false
    }
}

