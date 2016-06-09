//
//  YTPlayerViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 1 on 09/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class YTPlayerViewController: UIViewController ,YTPlayerViewDelegate{

    @IBOutlet weak var playerView:  YTPlayerView!
    var detailVideoID:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.playerView.delegate = self
        self.playerView.loadWithVideoId(detailVideoID)
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(YTPlayerViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
           }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

      override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func playerView(playerView: YTPlayerView!, didChangeToState state: YTPlayerState) {
        
        switch (state){
            
        case YTPlayerState.Playing:
            
            break
            
        case YTPlayerState.Paused:
            
            break
            
        default:
            
            break
            
        }
        
    }
    
    //MARK: Delegate method
    
    func playerView(playerView: YTPlayerView!, didChangeToQuality quality: YTPlaybackQuality) {
        
    }
    
    func playerView(playerView: YTPlayerView!, receivedError error: YTPlayerError) {
        
    }
    
    func playerViewDidBecomeReady(playerView: YTPlayerView!) {
        
        self.playerView.playVideo()
        
    }
    
}
    


