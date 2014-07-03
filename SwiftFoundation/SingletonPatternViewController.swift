//
//  SingletonPatternViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class SingletonPatternViewController: BaseViewController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("================================单例模式一==============================================")
        testSingleOne()
        println("================================单例模式二==============================================")
        testSingleTwo()
        println("================================单例模式三==============================================")
        testSingleThreee()
    }
    /*
    “等价于"（用三个等号表示，===） 与“等于"（用两个等号表示，==）的不同：
    “等价于”表示两个类类型（class type）的常量或者变量引用同一个类实例。
    “等于”表示两个实例的值“相等”或“相同”，判定时要遵照类设计者定义定义的评判标准，因此相比于“相等”，这是一种更加合适的叫法。
    */
    func testSingleOne(){
       let singleton1 = SingletonOne()
       let singleton2 = SingletonOne()
        if singleton1 === singleton2{
            println(singleton1)
            println(singleton2)
        }
        let singleton3 = SingletonOne.shareInstance
        let singleton4 = SingletonOne.shareInstance
        if singleton3 === singleton4{
            println(singleton3)
            println(singleton4)
        }
    
    }
    func testSingleTwo(){
        let singleton1 = SingletonTwo()
        let singleton2 = SingletonTwo()
        if singleton1 === singleton2{
            println(singleton1)
            println(singleton2)
        }
        let singleton3 = SingletonTwo.shareInstance
        let singleton4 = SingletonTwo.shareInstance
        if singleton3 === singleton4{
            println(singleton3)
            println(singleton4)
        }
        
    }
    func testSingleThreee(){
        let singleton1 = SingletonThree()
        let singleton2 = SingletonThree()
        if singleton1 === singleton2{
            println(singleton1)
            println(singleton2)
        }
        let singleton3 = SingletonThree.sharedInstance
        let singleton4 = SingletonThree.sharedInstance
        if singleton3 === singleton4{
            println(singleton3)
            println(singleton4)
        }
        
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
