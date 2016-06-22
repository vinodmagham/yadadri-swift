//
//  SongsTableViewCell.swift
//  Yadhagiri
//
//  Created by Kvana Dev Ipod on 07/06/16.
//  Copyright © 2016 Kvana Dev Ipod. All rights reserved.
//

import UIKit
import AVFoundation
class SongsTableViewCell: UITableViewCell,AVAudioPlayerDelegate{

    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var songLable: UILabel!

    var audioPlayer = AVAudioPlayer()
    var toggleState = 1
    var timer:NSTimer!
   
    override func awakeFromNib() {
            super.awakeFromNib()
        var updateTimer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateTime"), userInfo: nil, repeats: true)
        
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: Selector("updateSlider"), userInfo: nil, repeats: true)
        
        let pathString = NSBundle.mainBundle().pathForResource("Sreekara Subhakara-(Mr-Jatt.com)", ofType: "mp3")
        
        if let pathString = pathString {
            
            let pathURL = NSURL(fileURLWithPath: pathString)
            do {
                try audioPlayer = AVAudioPlayer(contentsOfURL: pathURL)
                
            } catch {
                print("error")
            }
        }
        musicSlider.maximumValue = Float(audioPlayer.duration)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func playButtonTapped(sender: AnyObject) {
        let playBtn = sender as! UIButton
        if toggleState == 1 {
            audioPlayer.play()
            toggleState = 2
            playBtn.setImage(UIImage(named:"pause.png"),forState:UIControlState.Normal)
            
        } else {
            audioPlayer.pause()
            toggleState = 1
            playBtn.setImage(UIImage(named:"play.png"),forState:UIControlState.Normal)
        }
        
    }

    func updateSlider() {
        musicSlider.value = Float(audioPlayer.currentTime)
    }

    @IBAction func sliderAction(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.currentTime = NSTimeInterval(musicSlider.value)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
       
    }

func updateTime() {
    let currentTime = Int(audioPlayer.currentTime)
    let duration = Int(audioPlayer.duration)
    let total = currentTime - duration
    var totalString = String(total)
    let minutes = currentTime/60
    let seconds = currentTime - minutes / 60
    timeLabel.text = NSString(format: "%02d:%02d", minutes,seconds) as String
}
    
}
