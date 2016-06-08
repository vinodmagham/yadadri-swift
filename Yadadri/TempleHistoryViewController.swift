//
//  TempleHistoryViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class TempleHistoryViewController: UIViewController {
       
        override func viewDidLoad() {
        super.viewDidLoad()
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(DetailTableViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
         self.navigationItem.title = "Temple History"
        
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

}
