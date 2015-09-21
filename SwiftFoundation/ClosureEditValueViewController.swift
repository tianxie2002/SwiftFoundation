//
//  ClosureEditValueViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-1.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
// oc 的中的写法 typedef void (^ZWProgressHUDCompletionBlock)(NSString:string);
typealias sendValueClosure=(string:String)->Void
class ClosureEditValueViewController: BaseViewController {


    var customClosure:sendValueClosure?
    //下面这个方法需要传入上个界面的someFunctionThatTakesAClosure函数指针
    func initWithClosure(closure:sendValueClosure?){
        //将函数指针赋值给myClosure闭包，该闭包中涵盖了someFunctionThatTakesAClosure函数中的局部变量等的引用
           customClosure = closure
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        // Custom initialization
    }
    init(closure: sendValueClosure)
    {
        super.init(nibName: nil,bundle: nil)
       customClosure = closure
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var btn = UIButton.buttonWithType(UIButtonType.System) as?UIButton
        btn!.frame = CGRectMake(0,100,320,50)
        btn!.setTitle("回调" ,forState:UIControlState.Normal)
        btn!.addTarget(self,action:"action", forControlEvents:UIControlEvents.TouchUpInside)
        self.view.addSubview(btn!)
        
        // Do any additional setup after loading the view.
    }
    func action(){
       
        //判空
        if (customClosure != nil){
            //闭包隐式调用someFunctionThatTakesAClosure函数：回调。
            customClosure!(string: "我是从第二个界面传过来的")
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


  