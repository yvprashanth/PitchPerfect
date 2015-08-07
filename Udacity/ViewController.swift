//
//  ViewController.swift
//  Udacity
//
//  Created by PrashMaya on 01/08/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.hidden = true;
        recordButton.enabled = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func recordAudio(sender: UIButton) {
        // TODO: Show Text - Recording in Progress
        println("record Audio");
        recordingInProgress.hidden = false;
        stopButton.hidden = false;
        recordButton.enabled = false;
    }
    
    @IBAction func stopRecord(sender: AnyObject) {
            recordingInProgress.hidden = true;
                recordButton.enabled = true;
    }
}

