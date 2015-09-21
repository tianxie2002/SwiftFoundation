//
//  UITableVie wController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-29.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class UITableBaseViewController: UIViewController,UITableViewDataSource,UITableViewDelegate
{

    var tableView: UITableView?
    var  itemArray : NSMutableArray?
    var  addItemBtn :UIButton?
    var  editItemBtn :UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.itemArray =  NSMutableArray()
       // self.itemArray?.addObject("1")
        self.setupViews()
        setupRightNaviBarItem()
        //setupLeftNaviBarItem()
        // Do any additional setup after loading the view.
    }
    /**
    *  初始化界面
    *
    *  @return <#return value description#>
    */
    func setupViews()
    {
        self.tableView = UITableView(frame:self.view!.frame)
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        self.tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.tableView!)
    }
    /**
    *  初始化左边的navi编辑
    *
    *  @return <#return value description#>
    */
    func setupLeftNaviBarItem()
    {
        self.editItemBtn = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        self.editItemBtn!.frame = CGRectMake(0,0,50,40)
        self.editItemBtn!.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.editItemBtn!.setTitle("添加", forState: UIControlState.Normal)
        //self.addItemBtn!.tag = 100
        self.editItemBtn!.userInteractionEnabled = true
        self.editItemBtn?.addTarget(self, action: "addUITableDataSouce", forControlEvents: UIControlEvents.TouchUpInside)
        var barButtonItem = UIBarButtonItem(customView: self.editItemBtn!)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    /**
    *  初始化右边的navaItem
    *
    *  @return <#return value description#>
    */
    func setupRightNaviBarItem()
    {
        self.addItemBtn = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        self.addItemBtn!.frame = CGRectMake(0,0,50,40)
        self.addItemBtn!.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.addItemBtn!.setTitle("添加", forState: UIControlState.Normal)
        //self.addItemBtn!.tag = 100
        self.addItemBtn!.userInteractionEnabled = true
        self.addItemBtn?.addTarget(self, action: "addUITableDataSouce", forControlEvents: UIControlEvents.TouchUpInside)
        var barButtonItem = UIBarButtonItem(customView: self.addItemBtn!)
        self.navigationItem.rightBarButtonItem = barButtonItem
    }
    /**
    *  添加数据
    *
    *  @return <#return value description#>
    */
    func addUITableDataSouce()
    {
      var row = self.itemArray!.count
      var indexPath = NSIndexPath(forRow:row,inSection:0)
        self.itemArray?.addObject("第\(row+1)行");
     self.tableView?.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Left)
     self.addItemBtn!.userInteractionEnabled = true
      
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.itemArray!.count
    }
   func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView .dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        //cell.textLabel.text = String(format: "%i", indexPath.row+1)
        cell.textLabel?.text = self.itemArray!.objectAtIndex(indexPath.row) as? String
        return cell
    }
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool
    {
        return true
    }
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.itemArray?.removeObjectAtIndex(indexPath.row)
        
        self.tableView?.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Top)
        if (self.itemArray!.count == 0)
        {
            //self.leftBtn!.userInteractionEnabled = false
        }
        
    }
    
//    func tableView(tableView: UITableView!, editingStyleForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCellEditingStyle
//    {
//        return (UITableViewCellEditingStyle.Delete)
//    }
//    
//    func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool
//    {
//        return true
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override  func viewDidDisappear(animated: Bool){
        /**
        *  uitabelview 删除奔溃的解决
        */
        self.tableView!.dataSource = nil
        self.tableView!.delegate = nil
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
