//
//  ProtocolEditValueViewControllerViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-1.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
import Foundation
protocol ProtocolEditValueDelegate:NSObjectProtocol
{
     func changeString(controller:ProtocolEditValueViewController,string:String)

}

class ProtocolEditValueViewController: BaseViewController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    var delegate:ProtocolEditValueDelegate?
    var stringField: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        stringField = UITextField(frame:CGRectMake(10, 100, 200.0, 30.0))
        stringField!.borderStyle = UITextBorderStyle.Line
        stringField!.backgroundColor = UIColor.whiteColor()
        stringField!.placeholder = "请输入内容"
        self.view.addSubview(self.stringField!)
        var btn = UIButton.buttonWithType(UIButtonType.System) as?UIButton
        btn!.frame = CGRectMake(0,150,320,50)
        btn!.setTitle("回调" ,forState:UIControlState.Normal)
        btn!.addTarget(self,action:"btnClicked", forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        // Do any additional setup after loading the view.
    }
    func btnClicked(){
        if (delegate != nil) {
            delegate!.changeString(self,string:stringField!.text)
           
        }
         self.navigationController?.popViewControllerAnimated(false)
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
