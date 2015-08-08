//
//  ViewController.swift
//  Udacity
//
//  Created by PrashMaya on 01/08/15.
//  Copyright (c) 2015 PrashMaya. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate{

    //Declared Globally
    var audioRecorder:AVAudioRecorder!
    var recordedAudio : RecordedAudio!
    
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
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
//        let currentDateTime = NSDate()
//        let formatter = NSDateFormatter()
//        formatter.dateFormat = "ddMMyyyy-HHmmss"
//        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let recordingName = "my_audio.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)

        
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self;
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        // TODO: Show Text - Recording in Progress
        println("record Audio");
        recordingInProgress.hidden = false;
        stopButton.hidden = false;
        recordButton.enabled = false;
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag){
            // TODO : Save the recorded audio
            recordedAudio = RecordedAudio();
            recordedAudio.filePathUrl = recorder.url;
            // This gives us the name of the recorded file
            recordedAudio.title = recorder.url.lastPathComponent;
            
            // TODO: Perform a segue
            self.performSegueWithIdentifier("stopRecord", sender: recordedAudio);
        }else{
            println();
            recordButton.enabled = true;
            stopButton.hidden = true;
        }
    }
    // Great place to pass any data
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "stopRecord") {
            let playSoundsVC:PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController;
            let data  = sender as! RecordedAudio;
            playSoundsVC.receivedAudio = data;
        }
    }
    
    @IBAction func stopRecord(sender: AnyObject) {
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
            recordingInProgress.hidden = true;
                recordButton.enabled = true;
    }
}

