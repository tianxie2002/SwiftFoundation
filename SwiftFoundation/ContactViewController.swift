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
    var name :String
    var phoneNum :String
    
    init(name:String,phoneNum:String)
    {
      self.name = name
      self.phoneNum = phoneNum
    }
}
class ContactViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource,UIAlertViewDelegate  {

    
    var dataTableView: UITableView?
    var dataArray = NSMutableArray()
    var databasePath: String!
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
   
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.creatContactTable()
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
        self.dataArray.removeAllObjects()
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
            alertView.addButtonWithTitle("增加")
            alertView.show()
        }
    }
    
    func creatContactTable(){
        
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
                   let contact = Contacter(name:resultSet.stringForColumn("NAME"),phoneNum:resultSet.stringForColumn("PHONE"))
                   self.dataArray.addObject(contact)
                }
                
            }
            
            if db.hadError() {
                let error = db.lastError()

            }
            db.close()
        }
        if dataArray.count != 0{
          return true
        }
        
        return false
    }
    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int)
    {
        if buttonIndex == 1{
           nextBtnClicked()
        }
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
      func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
       
        return 100;
    }
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        
//        let cell = tableView?.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
//        cell.textLabel.numberOfLines = 0
//        let  contact = self.dataArray[indexPath!.row] as Contacter
//        cell.textLabel.text = contact.name
//        cell.detailTextLabel.text = contact.name
//        return cell
        
        
        var cell = tableView!.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
        
        if !cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "CELL")
        }
        let  contact = self.dataArray[indexPath!.row] as Contacter
        cell!.textLabel.text = contact.name
        cell!.detailTextLabel.text = contact.phoneNum
       
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
