//
//  NewsViewCell.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-3.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class NewsViewCell: UITableViewCell {

    
//    @IBOutlet var title : UILabel = nil
//    @IBOutlet var newsDetail : UILabel = nil
//    @IBOutlet var newsImage : UIImageView = nil
    var newsTitle : UILabel?
    var newsDescrip : UILabel?
    var newsImageView : UIImageView?
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        setupViews()
//    }
   
     init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
       super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupViews()
    }
    
    func setupViews()
    {
        newsTitle = UILabel(frame:CGRectMake(115,10,195,20))
        newsTitle!.backgroundColor = UIColor.clearColor()
        newsTitle!.font = UIFont.systemFontOfSize(14)
        self.contentView.addSubview(newsTitle!)
        newsImageView = UIImageView(frame: CGRect(x: 5, y: 2, width: 100, height: 76))
        newsImageView!.contentMode = UIViewContentMode.ScaleAspectFill
        newsImageView!.backgroundColor = UIColor.clearColor()
        self.contentView.addSubview(newsImageView)
        newsDescrip = UILabel(frame:CGRectMake(115,25,195,50))
        newsDescrip!.numberOfLines = 0
        newsDescrip!.backgroundColor = UIColor.clearColor()
        newsDescrip!.textColor =  UIColor.lightGrayColor()
        newsDescrip!.font = UIFont.systemFontOfSize(13)
        self.contentView.addSubview(newsDescrip)
    }
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
