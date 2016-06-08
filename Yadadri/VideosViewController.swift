//
//  VideosViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 1 on 08/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit
import Parse


class VideosViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var videosListTable: UITableView!
    var allObjects: [AnyObject] = []
    var allObjectIds: [AnyObject] = []
       override func viewDidLoad() {
        super.viewDidLoad()
        self .getVideos()
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
        let token : NSString = allObjectIds[indexPath.row] as! NSString
        let imageData = NSData(contentsOfURL: NSURL(string: "https://www.youtube.com/watch?v=\(token).jpg")!)
        cell.videoThumbImage.image = UIImage(data: (imageData)!)
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell:UITableViewCell = videosListTable.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.orangeColor()
        if(indexPath.row == 0){
            let historyView : TempleHistoryViewController = storyboard?.instantiateViewControllerWithIdentifier("TempleHistoryViewController") as! TempleHistoryViewController
            self.navigationController?.pushViewController(historyView, animated: true)
           }
    }

}
