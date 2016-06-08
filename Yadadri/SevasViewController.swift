//
//  SevasViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class SevasViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var sevasTable: UITableView!
   
    var sevas = ["Suprabhata Seva","Nijabishekam", "Nijabishekam ( Couple)", "Sahasra Namarchana", "Kunkumarchana( Friday)(at Ustava Mandapama)", "Sri Sudershana Homam", "Kalyanothsavam","Jodu Seva","Pavalimpu Seva","One day Bramhostvam","Three days Bramhostvam","Five days Bramhostvam","Anjaneya Swamy Akupuja (Tuesday )","Sri Ammavari Lakshaa Tulasi Archana","Shathagatabhishekam(Swathi Nakshathram only)","Laksha Bilwarchana in Shivalayam","Andal Ammavari Abhishekam (Friday only)","Astoatharam","Shegradarshanam","Athi Shegradarshanam (1 Laddu 100 grms)","Gandadeepam","Ashwara Sweekaram","Annaprasana (After Nevedana)","Swarna Pushparchana (2 Laddus 100grms)","Sarvaseva Pathakam"]
    
    var cost = ["50.00","250.00","500.00","216.00","100.00","1,116.00","1,250.00","500.00","50.00","2,001.00","2,516.00","3,516.00","316.00","2,500.00","750.00","250.00","216.00","100.00","25.00","100.00","51.00","51.00","216.00","516.00","51,116.00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(DetailTableViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
        self.navigationItem.title = "Archanas & Sevas"

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sevas.count
    }
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section < headerTitles.count {
//            return headerTitles[section]
//        }
//        
//        return nil
//    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellReuseIdentifier = "Cell"
        let cell:SevasCustomCell = sevasTable.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! SevasCustomCell!
         cell.sevasLbl .text = sevas[indexPath.row]
         cell.costLbl.text = cost[indexPath.row]
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
        
        
        return cell
    }
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }



}
