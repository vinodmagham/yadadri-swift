//
//  TempleHistoryViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class TempleHistoryViewController: UIViewController {
       
    @IBOutlet weak var historyWebView: UIWebView!
        override func viewDidLoad() {
        super.viewDidLoad()
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(TempleHistoryViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
         self.navigationItem.title = "Temple History"
            
            let htmlFile = NSBundle.mainBundle().pathForResource("TempleHistory", ofType: "html")
            let htmlString = try? String(contentsOfFile: htmlFile!, encoding: NSUTF8StringEncoding)
            historyWebView.loadHTMLString(htmlString!, baseURL: nil)

        
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

}
