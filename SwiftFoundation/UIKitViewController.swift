//
//  UIKitViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-24.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class UIKitViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {


    var uikitTableView : UITableView?
    var uikitArray : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "图形"
        self.uikitArray = ["UITableView操作","UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UITextView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView"]
         self.uikitTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.uikitTableView!.delegate = self
        self.uikitTableView!.dataSource = self
        // self.uikitTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
       // self.uikitTableView!.
        self.view.addSubview(self.uikitTableView)
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
        return self.uikitArray!.count
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
        cell!.textLabel.text = self.uikitArray?.objectAtIndex(indexPath.row) as String
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.uikitTableView!.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row{
        case 0 :
            var detailViewController = UITableBaseViewController()
           detailViewController.title = self.uikitArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        default:
            var detailViewController = UIKitDetailViewController()
            detailViewController.title = self.uikitArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        }

        
//        var detailViewController = DetailViewController()
//        detailViewController.title = self.items?.objectAtIndex(indexPath.row)  as String
//        self.navigationController.pushViewController(detailViewController, animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
