//
//  OtherViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-24.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class OtherViewController: BaseViewController,  UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }

    var otherTableView : UITableView?
    var dataArray : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "其他"
        self.dataArray = ["地图"]
        self.otherTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.otherTableView!.delegate = self
        self.otherTableView!.dataSource = self
        let footView = UIView()
        footView.backgroundColor = UIColor.clearColor()
        self.otherTableView!.tableFooterView = footView
        self.otherTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // self.uikitTableView!.
        self.view.addSubview(self.otherTableView!)
    }
    // UITableViewDataSource Methods
    
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return 1
    }
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
        
        
        return 50;
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.dataArray!.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel?.text = self.dataArray!.objectAtIndex(indexPath.row) as? String
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        var detailViewController = MapViewViewController()
        detailViewController.title = self.dataArray!.objectAtIndex(indexPath.row)  as NSString
        self.navigationController?.pushViewController(detailViewController, animated:false)
    }
//    {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//        switch indexPath.row{
//        case 0:
//            var detailViewController = MapViewViewController()
//            detailViewController.title = self.dataArray?.objectAtIndex(indexPath.row)  as NSString
//            self.navigationController.pushViewController(detailViewController, animated:false)
//        default:
//            println()
//        }
//        
//        //        var detailViewController = DetailViewController()
//        //        detailViewController.title = self.items?.objectAtIndex(indexPath.row)  as String
//        //        self.navigationController.pushViewController(detailViewController, animated:true)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
}
