//
//  VideosViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 1 on 08/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit
import Parse
import AVFoundation
import AVKit
import YouTubePlayer


class VideosViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate {

@IBOutlet weak var videosListTable: UITableView!
    var allObjects: [AnyObject] = []
    var allObjectIds: [AnyObject] = []
    var thumbUrls: [AnyObject] = []
    var VideoID:String!
    
       override func viewDidLoad() {
        super.viewDidLoad()
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
       leftsidebarbutton.action=#selector(VideosViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
         self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
         self.navigationItem.title = "Videos"
        self .getVideos()
     }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       }
    
    func  getVideos()-> Void {
        
        let query = PFQuery(className:"Videos")
        query.findObjectsInBackgroundWithBlock {
            (objects  , error) -> Void in
            if error == nil{
                for object  in objects! {
                    self.allObjects.append(object["title"])
                     self.allObjectIds.append(object["videoId"])
                    self.thumbUrls.append(object["thumbUrl"])
//                    print(object["title"])
//                    print(object["videoId"])
                    
                }
                self.videosListTable .reloadData()

            }else{
                 print(error)
            }
        }
     
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allObjects.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "VideosTableViewCell"
        let cell:VideosTableViewCell = videosListTable.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! VideosTableViewCell!
        cell.videoTitleLabel.text =  allObjects[indexPath.row] as? String
        let imageUrl = thumbUrls[indexPath.row]
        let url = NSURL(string:imageUrl as! String)
        let   data = NSData(contentsOfURL:url!)
        if data != nil {
             cell.videoThumbImage.image = UIImage(data: (data)!)
        }
  
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        VideoID = allObjectIds[indexPath.row] as! String
        
        let doView : YTPlayerViewController = storyboard?.instantiateViewControllerWithIdentifier("YTPlayerViewController") as! YTPlayerViewController
        doView.detailVideoID = VideoID
        self.navigationController?.pushViewController(doView, animated: true)

    }
    
}
