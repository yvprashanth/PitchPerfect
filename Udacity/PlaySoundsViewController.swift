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
    var receivedAudio : RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
//            let fileUrl = NSURL(string: filePath);
//        }else {
//            println("The filepath is empty");
//        }
        
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil);
        audioPlayer.enableRate = true;

    }

    @IBAction func playFastAudio(sender: UIButton) {
        audioPlayer.play();
        audioPlayer.rate = 2.0;
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
            audioPlayer.play();
            audioPlayer.rate = 0.5;
        }
    }

