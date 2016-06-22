//
//  DetailTableViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class DetailTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var detailTable: UITableView!


     var tableList = ["History","Temple Timings", "Archanas & Sevas", "Do's & Dont's", "Important Temple Festivals", "Videos", "Songs","How to Reach","Prasadam's"]


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(DetailTableViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
        self.navigationItem.title = "Home"
       
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }
    
    
    
func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableList.count
    }
    
func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
      let cellReuseIdentifier = "cell"
    let cell:UITableViewCell = detailTable.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as UITableViewCell!
    
    cell.textLabel?.text = tableList[indexPath.row]
 
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let selectedCell:UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        selectedCell.contentView.backgroundColor = UIColor.orangeColor()
        if(indexPath.row == 0){
            let historyView : TempleHistoryViewController = storyboard?.instantiateViewControllerWithIdentifier("TempleHistoryViewController") as! TempleHistoryViewController
            self.navigationController?.pushViewController(historyView, animated: true)

            
        }
        else if(indexPath.row == 1){
            
            let timingsView : TempleTimingsViewController = storyboard?.instantiateViewControllerWithIdentifier("TempleTimingsViewController") as! TempleTimingsViewController
            self.navigationController?.pushViewController(timingsView, animated: true)
            
        }
        else if(indexPath.row == 2){
            
            let sevasView : SevasViewController = storyboard?.instantiateViewControllerWithIdentifier("SevasViewController") as! SevasViewController
            self.navigationController?.pushViewController(sevasView, animated: true)

            
        }
        else if(indexPath.row == 3){
            let doView : DoAndDontViewController = storyboard?.instantiateViewControllerWithIdentifier("DoAndDontViewController") as! DoAndDontViewController
            self.navigationController?.pushViewController(doView, animated: true)
            
        }
        else if(indexPath.row == 4){
            
            let prasadView : TempleFestivalsViewController = storyboard?.instantiateViewControllerWithIdentifier("TempleFestivalsViewController") as! TempleFestivalsViewController
            self.navigationController?.pushViewController(prasadView, animated: true)
            
        }
        else if(indexPath.row == 5){
            let videosView : VideosViewController = storyboard?.instantiateViewControllerWithIdentifier("VideosViewController") as! VideosViewController
            self.navigationController?.pushViewController(videosView, animated: true)
        }
        
        else if(indexPath.row == 6){
            let songsView : SongaViewController = storyboard?.instantiateViewControllerWithIdentifier("SongaViewController") as! SongaViewController
            self.navigationController?.pushViewController(songsView, animated: true)
         }
        else if(indexPath.row == 7){
            let timingsView : LocationsViewController = storyboard?.instantiateViewControllerWithIdentifier("LocationsViewController") as! LocationsViewController
            self.navigationController?.pushViewController(timingsView, animated: true)

            
        }
        
        else if(indexPath.row == 8){
            let prasadasView : PrasadasViewController = storyboard?.instantiateViewControllerWithIdentifier("PrasadasViewController") as! PrasadasViewController
            self.navigationController?.pushViewController(prasadasView, animated: true)
            
            
        }
    }
    
    
    


}

