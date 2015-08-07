//
//  PlaySoundsViewController.swift
//  Udacity
//
//  Created by PrashMaya on 01/08/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
            let fileUrl = NSURL(string: filePath);
            audioPlayer = AVAudioPlayer(contentsOfURL: fileUrl, error: nil);
            audioPlayer.enableRate = true;
        }else {
            println("The filepath is empty");
        }
    }

    
    @IBAction func playSlowAudio(sender: UIButton) {
            audioPlayer.play();
            audioPlayer.rate = 2.0;
        }
    }

