//
//  DataStoreViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-27.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class DataStoreViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource  {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }

    var dataTableView : UITableView?
    var dataArray : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "网络"
        self.dataArray = ["SQLite", "CoreData", "文件存储", "归档"]
        self.dataTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.dataTableView!.delegate = self
        self.dataTableView!.dataSource = self
        let footView = UIView()
        footView.backgroundColor = UIColor.lightGrayColor()
        self.dataTableView!.tableFooterView = footView
        self.dataTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.dataTableView)
    }
    // UITableViewDataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return 1
    }
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
        
        
        return 50;
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.dataArray!.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        //let cell =  UITableViewCell.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "Cell")
        //        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
        //
        //        if !cell {
        //            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        //        }
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell!.textLabel.text = self.dataArray?.objectAtIndex(indexPath.row) as String
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.dataTableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
        //        var detailViewController = DetailViewController()
        //        detailViewController.title = self.items?.objectAtIndex(indexPath.row)  as String
        //        self.navigationController.pushViewController(detailViewController, animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /*
    // #pragma mark - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */

}