//
//  BasicOperatorsController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  基本运算符
*/
class BasicOperatorsController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
     println("---------------------------------基本运算符-------------------------------------------------------")
        // 赋值操作符=，表示把某个值赋给对应的常量或者变量
        let b = 10
        var a = 5
        
        //如果右边的赋值是一个元组，那么可以分解成多个常量或者变量：
        // x = 1, y = 2
        let (x, y) = (1, 2)
        
        
        //在swift中，赋值语句不会以返回值，与C和OC是不同的。下面的写法是不对的：
        // Error，因为赋值语句不会返回值
        // x的值变为y的值，但是x是整型，不是Bool型
//        if x = y {
//        }
        
        //下面的加法是对字符串的，是执行字符串连接： "hello, " + "world" 
        
        //两个Character值或者一个是Character值，另一个是String类型，可以相加形成字符串:
        let dog: Character = "D"
        let cow: Character = "C"
        let dogCow = dog + cow
        
        //在swift中，求余可以是浮点数。
        //a = (b * some multiplier) + remainder
        // 9 = 2 * 4 + 1
        //9 % 4 // 1
        // -9 = (-2 * 4) + (-1)
        //-9 % 4 // -1
        // 9 = (-2 * -4) + 1
        //9 % -4 // 1
        // 8 = (3 * 2.5) + 0.5
        // 8 % 2.5 // 0.5
        //所以求余的结果是正数还是负数，就看第一个操作数是不是正数。如果第一个操作数是负数，那么余数是负数，否则是正数
        
       // 与C、OC中的自增版头运算符一样
//        var i = 0
//        j = ++i  // i = 1, j = 1
//        
//        var i = 0
//        j = i++ // i = 1, j = 0
//        
//        var i = 1
//        j = i-- // i = 0, j = 1
//        
//        var i = 1
//        j = --i // i = 0, j = 0 

        //三元运行符是  ? :
        let contentHeight = 40
        let hasHeader = true
        let rowHeight = contentHeight + (hasHeader ? 50 : 20)
        
       //范围运算符 在swift中提供了两种范围运算符，a..b和a...b，前者不包含b，后者包含b
        // 打印出12
        for index in 1..3 {
            print("\(index)")
        }
        
        // 打印出123
        for index in 1...3 {
            print("\(index)") 
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
