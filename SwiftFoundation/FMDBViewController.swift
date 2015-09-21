//
//  FMDBViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-1.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

extension UIView{
    
    var width:      CGFloat { return self.frame.size.width }
    var height:     CGFloat { return self.frame.size.height }
    var size:       CGSize  { return self.frame.size}
    
    var origin:     CGPoint { return self.frame.origin }
    var x:          CGFloat { return self.frame.origin.x }
    var y:          CGFloat { return self.frame.origin.y }
    var centerX:    CGFloat { return self.center.x }
    var centerY:    CGFloat { return self.center.y }
    
    var left:       CGFloat { return self.frame.origin.x }
    var right:      CGFloat { return self.frame.origin.x + self.frame.size.width }
    var top:        CGFloat { return self.frame.origin.y }
    var bottom:     CGFloat { return self.frame.origin.y + self.frame.size.height }
}


class FMDBViewController: BaseViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    var nameField : UITextField?
    var phoneField : UITextField?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // CreatContactTabel()
        let namelabel = UILabel(frame:CGRectMake(10.0, 80.0, 50, 30.0))
        namelabel.text = "姓名"
        self.view.addSubview(namelabel)
        nameField = UITextField(frame:CGRectMake(namelabel.right, namelabel.top, 200.0, 30.0))
        nameField!.borderStyle = UITextBorderStyle.Line
        nameField!.backgroundColor = UIColor.whiteColor()
        nameField!.placeholder = "请输入姓名"
        self.view.addSubview(self.nameField!)
        let phonelabel = UILabel(frame:CGRectMake(10.0, namelabel.bottom+10, 50, 30.0))
        phonelabel.text = "号码"
        self.view.addSubview(phonelabel)
        phoneField = UITextField(frame:CGRectMake(phonelabel.right, phonelabel.top, 200.0, 30.0))
        phoneField!.borderStyle = UITextBorderStyle.Line
        phoneField!.backgroundColor = UIColor.whiteColor()
        phoneField!.placeholder = "请输入号码"
        self.view.addSubview(phoneField!)
        let tapRecognizer: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "backupgroupTap")
        self.view.addGestureRecognizer(tapRecognizer)
        
        var button = UIButton.buttonWithType(UIButtonType.Custom) as? UIButton
        button!.frame = CGRectMake(110.0, phonelabel.bottom+10, 100.0, 50.0)
       // button!.backgroundColor = UIColor.grayColor()
        button?.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        button!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Highlighted)
        button?.setTitle("保存", forState: UIControlState.Normal)
        button?.addTarget(self, action: "saveData", forControlEvents: UIControlEvents.TouchUpInside)
        button!.tag = 100
        self.view.addSubview(button!)
        // Do any additional setup after loading the view.
    }
    
    func backupgroupTap()
    {
        nameField!.resignFirstResponder()
        phoneField!.resignFirstResponder()
    }
    
    
    func saveData()
    {
//        let docDirPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,
//            NSSearchPathDomainMask.UserDomainMask, true)[0] as String
//        
//        let databasePath = docDirPath.stringByAppendingPathComponent("contact.db")
//        let db = FMDatabase(path: databasePath)
//        if db.open() {
//            let name: NSString = nameField!.text
//            let phone: NSString = phoneField!.text
//            db.executeUpdate("INSERT INTO CONTACTS(NAME, PHONE) VALUES(?, ?)", withArgumentsInArray: [name, phone])
//            if db.hadError() {
//                let error = db.lastError()
//              //  label.text = error.localizedDescription
//            } else {
//               // label.text = name as String + " Saved"
//            }
//            db.close()
//        }
       self.navigationController?.popViewControllerAnimated(false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
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
