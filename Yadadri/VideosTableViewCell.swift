//
//  VideosTableViewCell.swift
//  Yadadri
//
//  Created by Kvana Inc 1 on 08/06/16.
//  Copyright © 2016 Kvana Inc 2. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell {

    @IBOutlet weak var videoThumbImage: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
