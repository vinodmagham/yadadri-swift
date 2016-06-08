//
//  DoAndDontViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class DoAndDontViewController: UIViewController {
    
    @IBOutlet weak var doTable: UITableView!
    
    let headerTitles = ["Do's", "Dont's"]
    var canDo = ["Do pray Lord Pancha Narasimha Swamy varu before pilgrimage to Yadagirigutta","Do contact Devasthanam information centre for enquiry,temple information and for pooja details etc", "Do concentrate on Lord Narasimha Swamy Varu and Goddess Andal Ammavaru inside the temple &Kshetrapalaka Anjaneya Swamy Varu", "Do deposit your offerings in the hundi only"]
    
    var dont = ["Don’t come to Yadagirigutta for any purpose other than worshipping of Sri Swamy Varu and Ammavaru","Darshanams(All)", "Don’t consume alcoholic drinks at Yadagirigutta temple surroundings", "Don’t eat non-vegetarian food in the Kshethram", "Don’t carry any weapon inside the temple, kindly switch of you mobiles", "Don’t wear any head guads like helmets, caps, tubans and hats inside the temple premises","Don’t perform ‘Sastanga Pranama’ in Antaralayam","Don’t take much time while performing ‘Darshanam’ to Swamy varu in Garbhalayam","Don’t buy spurious prasadams from street vendors","Don’t encourage beggars at Yadagirigutta","Don’t spit or create nuisance in the premises of the temple"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(DetailTableViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
        self.navigationItem.title = "Do's and Dont's"
        
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 80.0
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 0){
            return canDo.count
        }
        else{
            return dont.count
            
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
        let cell:DoTableViewCell = doTable.dequeueReusableCellWithIdentifier(cellReuseIdentifier) as! DoTableViewCell!
        if(indexPath.section == 0){
             cell.doAndDontLbl?.text = canDo[indexPath.row]
        }
        else{
            cell.doAndDontLbl?.text = dont[indexPath.row]
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        
        return cell
    }
    



}
