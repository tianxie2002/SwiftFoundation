//
//  UITableViewManager.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-25.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*   UITableView 形式的闭包
*   https://github.com/fullcorder/Swift-Closure-TableViewHelper
*/
class UITableViewManager: NSObject,UITableViewDelegate, UITableViewDataSource
{
    var numberOfRowsInsection   : (UITableView, Int) -> Int
    var cellForRowAtIndexPath   : (UITableView?, NSIndexPath!) -> UITableViewCell!
    var didSelectRowAtIndexPath : (UITableView?, NSIndexPath) -> Void
    
    init (numberOfRowsInsection aNumberOfRowsInsection : (UITableView, Int) -> Int,
        cellForRowAtIndexPath aCellForRowAtIndexPath   : (UITableView?, NSIndexPath!) -> UITableViewCell!,
        didSelectRowAtIndexPath aDidSelectRowAtIndexPath : (UITableView?, NSIndexPath) -> Void
        )
    {
        numberOfRowsInsection = aNumberOfRowsInsection
        cellForRowAtIndexPath = aCellForRowAtIndexPath
        didSelectRowAtIndexPath = aDidSelectRowAtIndexPath
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int

    {
        return numberOfRowsInsection(tableView, section)
    }
    
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        return cellForRowAtIndexPath(tableView, indexPath);
    }
    
    func tableView(tableView: UITableView?, didSelectRowAtIndexPath indexPath:NSIndexPath)
    {
        didSelectRowAtIndexPath(tableView, indexPath)
    }

}
