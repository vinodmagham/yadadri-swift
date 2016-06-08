//
//  TempleTimingsViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit


class TempleTimingsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let headerTitles = ["Morning", "Evening"]
    
    @IBOutlet weak var timingsTable: UITableView!
    var morningTimings = ["4-00 am to 4-30 am","4-30 am to 5-00 am", "5-00 am to 5-30 am", "5-30 am to 6-30 am", "6-30 am to 7-15 am", "7-15 am to 11-30 am", "11-30 am to 12-30 pm","12-30 pm to 3-00 pm","3-00 pm to 04-00 pm"]
    
    var eveningTimings = ["4-00 pm to 5-50 pm","5-00 pm to 7-00 pm", "7-00 pm to 7-30 pm", "7-30 pm to 8-15 pm", "8-15 pm to 9-00 pm", "9-00 pm to 09-30 pm", "09-30 pm to 09-45 pm","09-45 pm "]
    
    var morningEvents = ["Suprabhatam","Binde teertam", "Bala Bogam", "Nijabhishekam","Archana", "Darshanams(All)", "Maharaja Bogamu","Darshanams","Dwarabandanamu"]
    
    var eveningEvents = ["Special Darshanams","Darshanams(All)", "Aaradhana", "Archana", "Darshanams(All)", "Maha nivedhana","Shayanostavams","Temple close"]

    
       
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(DetailTableViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.title = "Darshanam Timings"
        
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
        
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

        

    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return morningTimings.count
                  }
        else{
            return eveningEvents.count

        }
           }
    
   func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section < headerTitles.count {
            return headerTitles[section]
        }
        
        return nil
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "Cell"
        let cell:TempleTimingsCustomCell = timingsTable.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! TempleTimingsCustomCell!
        if(indexPath.section == 0){
        cell.timeLbl?.text = morningTimings[indexPath.row]
        cell.eventLbl?.text = morningEvents[indexPath.row]
        }
        else{
            cell.timeLbl?.text = eveningTimings[indexPath.row]
            cell.eventLbl?.text = eveningEvents[indexPath.row]

        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }

        
    
}
