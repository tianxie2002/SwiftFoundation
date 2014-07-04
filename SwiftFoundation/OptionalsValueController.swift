//
//  OptionalsValueController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
  optional There is a value, and it equals x.  There isn't a value at all.
*/
class OptionalsValueController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        在C或者OC中不存在Optionals这个概念。在OC中最最近这个概念意思的是：在函数调用时，返回对象或者返回nil，这个nil意味着
//        有效对象的absence value.然后，这仅对对象起作用，对结构体、基本C类型或者枚举值类型不起作用，对于这些类型，OC中通过
//        返回NSNotFound这个特殊的值来表明absence value，通过这个值，函数调用者就可以检测处理。在Swift中，optionals可以是任何
//        类型，不需要特殊的常量表示。
        
        // 这个字符串是完全由数字组成的
        let possibleNumber = "123"
        // 这里调用toInt()方法时，转换可能会失败，所以返回的是Optional类型，也就是Int?类型，
        // 相当于Optional<Int>，返回值是说：要么有整型值，要么根本就没有值
        // 因为这里possibleNumber完全是由数字组成的字符串，所以转换成功，因此得到整型值123
        let convertedNumber = possibleNumber.toInt()
        
        // 这个字符串不是由数字组成的
        let originalString = "hello, world"
        // 这里调用toInt()方法时，转换可能会失败，所以返回的是Optional类型，也就是Int？类型，
        // 因为这里的originalString不是由数字组成的，所以转换失败，返回值就是没有值
        let resultNumber = originalString.toInt()
        /*
        If 语句与强制拆包
        可以使用if语句来检测optional是否包含值，如果包含值，就表示true,如果根本没有值，就表示false.
        当我们确定optional包含值，可以使用!来访问，这个！放在这个optional名字后面。这个！表明：我知道这个
        optional一定有值，请使用它。这就是所谓的：可选值的强制拆包（forced upwrapping of the optional's value）
        看下面的例子：
        */
        // convertedNumber is an optional value
        // 如果convertedNumber存在值，那么表达式就是true
        if convertedNumber {
            // 如果能够进到这里，表示convertedNumber一定有值，那么我们就可以强制拆包
            // 强制拆包就是在optional value后面添加一个！，也就是convertedNumber!
            // 但这也是需要注意的地方，使用强制拆包一定要确保这个可选值有值，否则
            // 强制拆包会崩溃
            println("\(possibleNumber) has an integer value of \(convertedNumber!)")
        } else {
            println("\(possibleNumber) could not be converted to an integer")
        }
        
//        尝试使用！来访问不存在值的optional value 会触发运行时错误。当我们使用!来强制拆包(force-unwrap)的时候，
//        一定要确保这个optional value一定包含一个非nil 值。
        
//        可选绑定（optional binding）
//        我们可以使用optional binding来判断这个optional 是否包含一个值，确保值是可用的，并作为临时常量或者变量的值。
//        Optional binding可以使用if 和 while 语句中，用来检测optional是否包含值，并取出其中的值给常量或者变量。optional
//        binding的写法是：
        
//        if let constantName = someOptional {
//            statements
//        }
        
        let number = "123"
        if let actualNumber = number.toInt() {
            println("\(possibleNumber) has an integer value of \(actualNumber)")
        } else {
            println("\(possibleNumber) could cant be converted to an integer")
        }
        
        // 这个optional是Int?类型，初始值为404
        var serverResponseCode: Int? = 404
        // 把serverResponseCode设置为nil后，serverResponseCode现在不再有值，也就是Optional.None
        serverResponseCode = nil
//        非optional类型常量和变量是不能设置为nil的，这与OC用的nil不同。
//        如果在代码中不确定这个变量或者常量是否有值，那么就声明为optional。
//        如果在定义Optional常量或者变量时，没有给定初始值，那么会自动设置为nil,表示Optional.None,即没有值。
        // surveyAnswer的值就是nil
         var surveyAnswer: String?
//        SWIFT中的nil不同与OC中的nil，在OC中，nil表示不存在的对象。在Swit中，nil不是指针，只是表示某种类型的值不存在，
//        optional可以设置任何类型值为nil，不仅仅是对象类型。
//        
//        隐式拆包可选值(Implicitly Unwrapped Optionals)
//        有时候，我们可以确定一旦变量或者常量被创建并初始化后，一直都会有值，那么可以就可以使用隐式拆包方式获取值。
//        在声明变量时，不是使用？来声明可选值，而是使用！来声明。
        let possibleString: String? = "An optional string."
        // 这是强制拆包
        println(possibleString!)
        
        let assumedString: String! = "An implicitly unwrapped optional string."
        // 不需要添加！来拆包
        println(assumedString)
        
//        如果尝试访问的隐式拆包可选值不包含值，会触发运行时错误。
//        我们依然可以你正常的optional一样，使用if或者while 判断隐式拆包可选值是否包含值，如果包含值，会返回true,否则返回false
        if assumedString {
            println(assumedString)
        }
        //如果还可以像正常的optional一样使用optional binding来使用隐式拆包可选值。
        //隐式拆包可选值不能出现不包含值的情况，否则会崩溃。所以如果不确定运行时值会不会出现nil,那么使用普通的optional会更好。
        if let definiteString = assumedString {
            println(definiteString)
        }
//        断言（Assertions）
//        Optionals使得我们可以检测值是否存在。在某些情况下，如果某个值不存在或者没有提供特定的满足条件，代码不应该继续往下执行。
//        在这些情况下，可以使用触发断言来终止执行并提供调试。
//        断言是在运行时检测条件是否为true,如果为true,就继续往下执行，否则就在这里中断。
//        断言对应的关键字是assert
//        let age = 18
//        // 这里age >= 18表示式的结果是true,所以这里断言什么也不做，代码继续往下执行
//        assert(age >= 18, "A person'a age cannot be less than eighteen")
//        // 这里由于 age >= 22表达式的结果是false，所以这里就会出现中断，打印出
//        // ""A person's age cannot be less than 22"
//        assert(age > 22, "A person's age cannot be less than 22")
        
        
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
