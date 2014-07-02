//
//  UIImageCacheViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class UIImageCacheViewController: BaseViewController,UITableViewDataSource, UITableViewDelegate {

    var tableView: UITableView?
    var mdataArray: Array<String> = {
        var dataArray = Array<String>()
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456568.jpg")
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456566.jpg")
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456567.jpg")
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456569.jpg")
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456570.jpg")
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456571.jpg")
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456572.jpg")
        dataArray.append("http://pic1.win4000.com/pic/9/44/4263456573.jpg")
        return dataArray
        }()
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: self.view.bounds)
        tableView!.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        tableView!.delegate = self
        tableView!.dataSource = self
        self.view!.addSubview(tableView)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return mdataArray.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("CellIdentifier") as? UITableViewCell
        if !cell  {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CellIdentifier")
            var imageView = UIImageView(frame: CGRect(x: 20, y: 0, width: 200, height: 150))
            imageView.contentMode = UIViewContentMode.ScaleAspectFit
            imageView.backgroundColor = UIColor.clearColor()
            imageView.tag = 100
            cell.contentView.addSubview(imageView)
        }
        var url = mdataArray[indexPath.row]
        var imageView:UIImageView! = cell.contentView.viewWithTag(100) as? UIImageView
        imageView.setImage(url, placeHolder: nil)
        
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 150
    }

   

}
