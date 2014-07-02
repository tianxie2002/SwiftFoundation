//
//  FoundationViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-24.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class FoundationViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    var  foundationTableView : UITableView?
    var  foundationArray : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基础"
        self.foundationArray = ["Closures闭包",
                            "Protocol传值",
                            "单例模式",
                          ]
        self.foundationTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.foundationTableView!.delegate = self
        self.foundationTableView!.dataSource = self
        // self.uikitTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // self.uikitTableView!.
        self.view.addSubview(self.foundationTableView)
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
        return self.foundationArray!.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        //let cell =  UITableViewCell.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "Cell")
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
        
        if !cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell!.textLabel.text = self.foundationArray?.objectAtIndex(indexPath.row) as String
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.foundationTableView!.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row
        {
        case 0:
         var detailViewController = ClosureShowValueViewController()
         detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
         self.navigationController.pushViewController(detailViewController, animated:false)
        case 1:
            var detailViewController = ProtocolShowValueViewController()
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 2:
            var detailViewController = SingletonPatternViewController()
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
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
