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
        self.uikitArray = ["UILabel", "UIButton", "UIImageView", "UISlider", "UIWebView", "UISegmentedControl", "UISwitch", "UITextField", "UIScrollView", "UISearchBar", "UIPageControl", "UIDatePicker", "UIPickerView", "UIProgressView", "UITextView", "UIToolbar", "UIActionSheet", "UIActivityIndicatorView"]
         self.uikitTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.uikitTableView!.delegate = self
        self.uikitTableView!.dataSource = self
         self.uikitTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(self.uikitTableView)
    }
    // UITableViewDataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.uikitArray!.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel.text = self.uikitArray?.objectAtIndex(indexPath.row) as String
        
        return cell
    }
    
    // UITableViewDelegate Methods
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.uikitTableView!.deselectRowAtIndexPath(indexPath, animated: true)
        
//        var detailViewController = DetailViewController()
//        detailViewController.title = self.items?.objectAtIndex(indexPath.row)  as String
//        self.navigationController.pushViewController(detailViewController, animated:true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
