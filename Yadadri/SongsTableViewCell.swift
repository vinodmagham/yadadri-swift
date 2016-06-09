//
//  SongsTableViewCell.swift
//  Yadhagiri
//
//  Created by Kvana Dev Ipod on 07/06/16.
//  Copyright © 2016 Kvana Dev Ipod. All rights reserved.
//

import UIKit
import AVFoundation
class SongsTableViewCell: UITableViewCell {

    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var songLable: UILabel!
   
    var player:AVAudioPlayer?
    var timer:NSTimer!
    
   
    override func awakeFromNib() {
            super.awakeFromNib()
            musicSlider.value = 0.0
//        var error : NSError? = nil
//         let url = NSURL(string: "https://s3.amazonaws.com/kargopolov/BlueCafe.mp3")
//        playerItem = AVPlayerItem(URL: url!)
//        player=AVPlayer(playerItem: playerItem!)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    func updateMusicSlider(){
        
        musicSlider.value = Float(player!.currentTime)
    }
  
    
    @IBAction func playButtonTapped(sender: AnyObject) {
        
        if player?.rate == 0
        {
            player!.stop()
            playButton.setImage(UIImage(named: "pause"), forState: UIControlState.Normal)
        } else {
            music()
            playButton.setImage(UIImage(named: "play"), forState: UIControlState.Normal)
//            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateTime", userInfo: nil, repeats: true)
            
 
        }
        
    }
    
    func music(){
        do
        {
        let soundURL = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("Sreekara Subhakara-(Mr-Jatt.com)", ofType: "mp3")!)
               
        let error : NSError? = nil
        player = try AVAudioPlayer(contentsOfURL: soundURL)
        musicSlider.maximumValue = Float(player!.duration)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: Selector("updateMusicSlider"), userInfo: nil, repeats: true)
//        player!.delegate = self
        if error == nil {
//            player!.delegate = self
            player!.prepareToPlay()
            player!.play()
        }
        }
        catch
        {}
    }

//    func updateTime() {
//        let cmTime = player!.currentTime
//        let floatTime = Float(CMTimeGetSeconds(player!.currentTime()))
//        musicSlider.value = floatTime
//           timeLabel.text = NSString(format: "%.2f", musicSlider.value) as String
//    }

    @IBAction func musicSliderAction(sender: AnyObject) {
        player!.stop()
        player!.currentTime = NSTimeInterval(musicSlider.value)
        player!.play()
        
    }
    
}
