
//
//  SevasCustomCellTableViewCell.swift
//  Yadadri
//
//  Created by Kvana Inc 2 on 07/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class SevasCustomCell: UITableViewCell {

    @IBOutlet  var sevasLbl: UILabel!
    @IBOutlet  var costLbl: UILabel!
   
    override func awakeFromNib() {
        super.awakeFromNib()
           }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

     
    }

}
