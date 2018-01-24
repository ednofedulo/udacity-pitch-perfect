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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(_ sender: Any) {
        print("record button was pressed!")
        recordLabel.text = "Recording..." q
    }
    
    @IBAction func stopRecordAudio(_ sender: Any) {
        recordLabel.text = "Tap to record"
    }
}

