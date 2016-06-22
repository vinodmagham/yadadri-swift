//
//  SongaViewController.swift
//  Yadhagiri
//
//  Created by Kvana Dev Ipod on 07/06/16.
//  Copyright © 2016 Kvana Dev Ipod. All rights reserved.
//

import UIKit


class SongaViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet weak var songsTableView: UITableView!
  
    var songsArray: [String] = ["Srikara shubakara", "Yadhagirinamaha","Namashivaya","Laximinarasimha","Mangalam","Om"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        self.songsTableView.dataSource = self
        self.songsTableView.delegate = self
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(DetailTableViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
        self.navigationItem.title = "Audio Songs"
    
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songsArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 60;
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "Cell"
        var cell:SongsTableViewCell! = tableView.dequeueReusableCellWithIdentifier(identifier) as? SongsTableViewCell
        tableView.registerNib(UINib(nibName: "SongsTableViewCell", bundle: nil), forCellReuseIdentifier: identifier)
        cell = tableView.dequeueReusableCellWithIdentifier(identifier) as? SongsTableViewCell
        
        cell.songLable.text = songsArray[indexPath.row]
      
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

}
