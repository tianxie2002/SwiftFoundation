//
//  NeteaseNewsCell.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class NeteaseNewsCell: UITableViewCell {

    
    @IBOutlet var newImage : UIImageView
    @IBOutlet var title : UILabel
    
    @IBOutlet var newsDetail : UILabel = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
