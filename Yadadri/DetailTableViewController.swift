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
     var tableList = ["History","Temple Timings", "Archanas & Sevas", "Do's & Dont's", "Prasadas", "Songs", "Bhajanas"]
    
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
            
            let timingsView : SevasViewController = storyboard?.instantiateViewControllerWithIdentifier("SevasViewController") as! SevasViewController
            self.navigationController?.pushViewController(timingsView, animated: true)

            
        }
        else if(indexPath.row == 3){
            let timingsView : DoAndDontViewController = storyboard?.instantiateViewControllerWithIdentifier("DoAndDontViewController") as! DoAndDontViewController
            self.navigationController?.pushViewController(timingsView, animated: true)
            
        }
        else if(indexPath.row == 4){
            
            let timingsView : PrasadasViewController = storyboard?.instantiateViewControllerWithIdentifier("PrasadasViewController") as! PrasadasViewController
            self.navigationController?.pushViewController(timingsView, animated: true)
            
        }
        else if(indexPath.row == 5){
            
        }





    
    }
    
    
    


}
