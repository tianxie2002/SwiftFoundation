//
//  0ptionalTypeViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class OptionalTypeViewController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    /*Swift语言使用var定义变量，但和别的语言不同，Swift里不会自动给变量赋初始值，
    也就是说变量不会有默认值，所以要求使用变量之前必须要对其初始化
    。如果在使用变量之前不进行初始化就会报错：
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        //error: variable 'stringValue' used before being initialized
        //let hashValue = stringValue.hashValue

       // var stringValue : String
       // let hashValue = stringValue.hashValue
        // 这就是optional, strValue自动得到默认值：nil
        // 这个nil跟Objective-C中的nil不同，不是指针，而是表示值不存在。
        /*出错的原因就是在使用stringValue这个变量之前，没有初始化这个变量，也就是这个变量根本就没有得到内存，
        这时就会出错。
        那么我们可以使用optional类型，后面跟一个？就是了。
        */
        var stringValue: String?
        // 判断optional是否有值
        if stringValue {
            // do what you need to do here
        }
        /*
        文档中有提到说，在使用Optional值的时候需要在具体的操作，比如调用方法、属性、下标索引等前面需要加上一个？，如果是nil值（不存在值），也就是Optional.None，会跳过后面的操作不执行，如果有值，就是Optional.Some可能就会拆包(unwrap)，然后对拆包后的值执行后面的操作，来保证执行这个操作的安全性，比如Optional binding:
        */
        // optional binding
        // 如果strValue == nil, 那么结果就是nil,不会调用String的hasValue
        // 如果strValue != nil, 就返回strValue对应的hashValue值并赋值给常量hashValue
        if let hashValue = stringValue?.hashValue {
            // do something if neccessary
        }
        // @objc 是用于处理Swift与OC之间的转换的，由于@optional是OC中的关键字，
        // 所以在protocol之前需要添加上@objc。
//        @objc protocol HttpRequestDelegate {
//            // @optional 说明这个代理方法是可选方法，
//            // 那么在调用的时候，需要这样调用：delegate?.requestFinished?(self, downloadData)
//            // 其中delegate?是因为delegate也是optional的
//            @optional func requestFinished(request: HttpRequest!, downloadData: NSMutableData!)
//            
//            // other funcs ...
//        }
          //来强制拆包，这是我们在保证有值的情况下才会这么用：
        var strValue: String?
        strValue = "1234"
        
        let integer = strValue!.toInt()
        // 更安全的写法是
        if strValue {
            let integer = strValue!.toInt()
        }
        
        
        /*
        通常在什么情况下才会使用optional类型呢？
        （1）当我们需要声明这样一个变量，变量在设计初始化函数中没有进行初始化时，就需要声明这个变量为optional类型。因为变量在使用前必须先
        声明，并且在设计初始化函数中进行初始化。比如我们在viewDidLoad函数中才进行初始化的控件（类成员），就需要声明为optional且必须是var声明，
        因为let声明的常量只能是在初始化函数中进行初始化。
        （2）当我们不知道是否会有值的时候，这个变量可以声明为optional,比如代理，我们并没有要求必须传代理过来，那么就需要声明为optional。
        （3）作为函数参数时，如果这个参数可以没有值，那么就使用optional类型，比如传代理的时候，通常就是可选的，可以设置为nil
        
        */
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
