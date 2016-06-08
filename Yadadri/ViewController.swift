//
//  ViewController.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet  var detailButton: UIButton!
    @IBOutlet  var GodImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.GodImageView.layer.cornerRadius = (self.GodImageView.frame.size.width)/2
        self.GodImageView.clipsToBounds = true
        detailButton.layer.cornerRadius = 5
        detailButton.layer.borderWidth = 1
        detailButton.layer.borderColor = UIColor.blackColor().CGColor
    }
    @IBAction func detailsClicked(sender: AnyObject) {
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

