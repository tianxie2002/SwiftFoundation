//
//  ClosureShowValueViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-1.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class ClosureShowValueViewController: BaseViewController {



    //var myLabel:UILabel?
    var btn:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        var item = UIBarButtonItem(title:"下一页",style:UIBarButtonItemStyle.Plain,target:self,action:"nextBtnClicked")
//        self.navigationItem.rightBarButtonItem = item
//        
//        myLabel = UILabel(frame:CGRectMake(0,100,320,50))
//        myLabel!.text = "Closure传值"
//        myLabel!.textAlignment = NSTextAlignment.Center
//        self.view.addSubview(myLabel)
        
        btn = UIButton.buttonWithType(UIButtonType.System) as?UIButton
        btn!.frame = CGRectMake(0,100,320,50)
        btn!.setTitle("获取下一页的值" ,forState:UIControlState.Normal)
        btn!.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btn!.addTarget(self,action:"nextBtnClicked", forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(btn)
        
        // Do any additional setup after loading the view.
    }
    func getCurrentClosureValue(string:String) -> Void {
        
         btn!.setTitle(string ,forState:UIControlState.Normal)
    }
    func nextBtnClicked(){
        let second = ClosureEditValueViewController(getCurrentClosureValue)
        self.navigationController.pushViewController(second,animated:false)
        
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
