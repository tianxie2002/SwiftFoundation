//
//  NewsViewCell.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-3.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    
    @IBOutlet var title : UILabel = nil
    @IBOutlet var newsDetail : UILabel = nil
    @IBOutlet var newsImage : UIImageView = nil
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
