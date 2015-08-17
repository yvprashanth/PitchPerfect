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
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
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
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
    }

    @IBAction func playFastAudio(sender: UIButton) {
        audioPlayer.play();
        audioPlayer.rate = 2.0;
    }
    
    @IBAction func playSlowAudio(sender: UIButton) {
            audioPlayer.play();
            audioPlayer.rate = 0.5;
        }
    
    @IBAction func playChipmunkAudio(sender: UIButton) {
        playAudioWithVariablePitch(1000);
    }
    
    @IBAction func playDarthVaderAudio(sender: UIButton) {
        playAudioWithVariablePitch(-1000);
    }
    
    func playAudioWithVariablePitch(pitch : Float){
        audioPlayer.stop();
        audioEngine.stop();
        audioEngine.reset();
        var audioPlayerNode = AVAudioPlayerNode();
        audioEngine.attachNode(audioPlayerNode);
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch;
        audioEngine.attachNode(changePitchEffect);

        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil);
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil);
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
    }
    
}

