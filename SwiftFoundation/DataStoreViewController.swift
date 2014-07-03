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
        self.title = "数据"
        self.dataArray = ["百度知道", "SQLite-FMDB", "图片缓存","网易新闻"]
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
        switch indexPath.row{
        case 0 :
            var detailViewController = BaiduZhiDaoController()
            detailViewController.title = self.dataArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 1 :
            var detailViewController = ContactViewController(nibName: nil, bundle: nil)
            detailViewController.title = self.dataArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 2 :
            var detailViewController = UIImageCacheViewController(nibName: nil, bundle: nil)
            detailViewController.title = self.dataArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 3 :
            var detailViewController = NeteaseViewController(nibName: nil, bundle: nil)
            detailViewController.title = self.dataArray?.objectAtIndex(indexPath.row)  as String
            detailViewController.hidesBottomBarWhenPushed = true;
            self.navigationController.pushViewController(detailViewController, animated:false)
            
        default:
            println()
        }
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
