//
//  TuplesViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*   元组
*   元组是多个值组合而成的复合值。元组中的值可以是任意类型，而且每一个元素的类型可以是不同的。
*  作为函数返回值时，元组非常有用。一个用来获取网页的函数可能会返回一个(Int, String)元组来描述是否获取成功。和只能返回一个类型的值比较起来，
*   一个包含两个不同类型值的元组可以让函数的返回信息更有用
*/

class TuplesViewController: BaseViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // http404Error是(Int, String)类型
        // 一个Int值和一个String值组合起来表示 HTTP 状态码的两个部分：一个数字和一个人类可读的描述。这个元组可以被描述为“一个类型为(Int, String)的元组
        let http404Error = (404, "Not Found")
        
        // 元组是可以分解的。
        let (statusCode, statusMessage) = http404Error
        // prints "The status code is 404"
        println("The status code is \(statusCode)")
        println("The status message is \(statusMessage)")
   
        //元组在分解时，可以只分解部分值，而忽略其它值，忽略其它值可以用下划线_来代替.
        let (code, _) = http404Error
        println("The status code is \(code)")
        
        //访问元组的另外一种方式：通过下标获取，从0开始
        // 通过元组.0获取第二个值
        println("The status code is \(http404Error.0)")
        // 通过元组.1获取第二个值
        println("The status message is \(http404Error.1)")
        
       //访问元组元素还有一种方式：给定元组元素命名，然后通过名称获取值(元组.名称)
        let http200Status = (statusCode: 200, description: "OK")
        println("The status code is \(http200Status.statusCode)")
        println("The status message is \(http200Status.description)")
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
