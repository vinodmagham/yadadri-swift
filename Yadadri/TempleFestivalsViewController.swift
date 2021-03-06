//
//  TempleFestivalsViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 1 on 10/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class TempleFestivalsViewController: UIViewController {

    @IBOutlet weak var festivalWebView: UIWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftsidebarbutton=UIBarButtonItem();
        leftsidebarbutton.image=UIImage(named:"backArrow")
        leftsidebarbutton.style=UIBarButtonItemStyle.Plain
        leftsidebarbutton.target=self
        leftsidebarbutton.action=#selector(TempleFestivalsViewController.goBack)
        self.navigationItem.leftBarButtonItem=leftsidebarbutton
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor .blackColor()
        self.navigationItem.title = "Festivals"
        
        let htmlFile = NSBundle.mainBundle().pathForResource("TempleFestivals", ofType: "html")
        let htmlString = try? String(contentsOfFile: htmlFile!, encoding: NSUTF8StringEncoding)
        festivalWebView.loadHTMLString(htmlString!, baseURL: nil)
      
    }
    
    func goBack() {
        self.navigationController!.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
