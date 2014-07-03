//
//  ContactViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-3.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
class  Contacter
{
    var name :String?
    var phoneNum :String?
    
    init(name:String,phoneNum:String)
    {
      self.name = name
      self.phoneNum = phoneNum
    }
}
class ContactViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate  {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    var dataTableView: UITableView?
    var dataArray = NSMutableArray()
    var databasePath: String!
    override func viewDidLoad()
   {
    super.viewDidLoad()
    CreatContactTabel()
    var item = UIBarButtonItem(title:"添加",style:UIBarButtonItemStyle.Plain,target:self,action:"nextBtnClicked")
    self.navigationItem.rightBarButtonItem = item
    self.dataTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
    self.dataTableView!.delegate = self
    self.dataTableView!.dataSource = self
    let footView = UIView()
    footView.backgroundColor = UIColor.lightGrayColor()
    self.dataTableView!.tableFooterView = footView
    self.dataTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    self.view.addSubview(self.dataTableView)
    }
    override  func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        if ShowContact()
        {
          self.dataTableView!.reloadData()
        }else
        {
            var alertView = UIAlertView()
           // alertView.title = "Title"
            alertView.delegate = self
            alertView.message = "当前没有联系人信息"
            alertView.addButtonWithTitle("取消")
            alertView.show()
        }
    }
    
    func CreatContactTabel(){
        
        let docDirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.UserDomainMask, true)[0] as String
        
        databasePath = docDirPath.stringByAppendingPathComponent("contact.db")
        
        let fileMgr = NSFileManager.defaultManager()
        
        if !fileMgr.fileExistsAtPath(databasePath) {
            let db = FMDatabase(path: databasePath)
            if db.open() {
                db.executeUpdate("CREATE TABLE IF NOT EXISTS CONTACTS " +
                    "( ID INTEGER PRIMARY KEY AUTOINCREMENT, " +
                    " NAME TEXT, " +
                    " PHONE TEXT)", withArgumentsInArray: nil)
                if db.hadError() {
                    let error = db.lastError()
                    // label.text = error.localizedDescription
                }
                
                db.close()
            }
        }
    }
    /**
    *  显示联系人信息
    *
    *  @return 是否存在联系人数据
    */
    func ShowContact() ->Bool{
    
        let db = FMDatabase(path: databasePath)
        if db.open() {
            let resultSet = db.executeQuery("SELECT * FROM CONTACTS",withArgumentsInArray:nil)
            if resultSet {
                while resultSet.next() {
                    //addressField.text = resultSet.stringForColumn("ADDRESS")
                    //phoneField.text = resultSet.stringForColumn("PHONE")
                   let contact = Contacter(name:resultSet.stringForColumn("ADDRESS"),phoneNum:resultSet.stringForColumn("PHONE"))
                   self.dataArray.addObject(contact)
                }
                db.close()
                return true
            }
            
            if db.hadError() {
                let error = db.lastError()

            }
            db.close()
        }

        
        return false
    }
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int)
    {
    
    }
    
    func nextBtnClicked()
    {
        var detailViewController = FMDBViewController(nibName: nil, bundle: nil)
        detailViewController.title = "添加联系人"
        self.navigationController.pushViewController(detailViewController, animated:false)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func tableView(tableView: UITableView!, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
        
        return 150;
    }
    
    
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        
        let cell = tableView?.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.numberOfLines = 0
        cell.textLabel.text = self.dataArray[indexPath!.row] as String
        return cell
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
