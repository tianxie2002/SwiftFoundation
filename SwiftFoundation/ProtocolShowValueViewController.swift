//
//  ProtocolShowValueViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-1.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class ProtocolShowValueViewController: BaseViewController,ProtocolEditValueDelegate {
   
//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
   
    var myLabel:UILabel?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        var item = UIBarButtonItem(title:"编辑",style:UIBarButtonItemStyle.Plain,target:self,action:"nextBtnClicked")
        self.navigationItem.rightBarButtonItem = item
        myLabel = UILabel(frame:CGRectMake(0,100,320,60))
        myLabel!.text = "当前值——0"
        myLabel!.textAlignment = NSTextAlignment.Center
        self.view.addSubview(myLabel)
        // Do any additional setup after loading the view.
    }
    func nextBtnClicked()
    {
      let svc = ProtocolEditValueViewController()
      svc.delegate = self
      self.navigationController.pushViewController(svc,animated:false)
    }
    func changeString(controller:ProtocolEditValueViewController,string:String){
      myLabel!.text = string
    
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
