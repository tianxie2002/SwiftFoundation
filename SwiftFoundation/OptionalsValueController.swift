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

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println("---------------------------------可选值-------------------------------------------------------")
//        在C或者OC中不存在Optionals这个概念。在OC中最接近这个概念意思的是：在函数调用时，返回对象或者返回nil，这个nil意味着
//        缺少一个合法的对象.然后，这仅对对象起作用，对结构体、基本C类型或者枚举值类型不起作用，对于这些类型，OC中通过
//        返回NSNotFound这个特殊的值来表明absence value，通过这个值，函数调用者就可以检测处理。在Swift中，optionals可以是任何
//        类型，不需要特殊的常量表示。
        
        // 变量初始化
        //Swift语言使用var定义变量，但和别的语言不同，Swift里不会自动给变量赋初始值，也就是说变量不会有默认值，所以要求使用变量之前必须要对其初始化。如果在使用变量之前不进行初始化就会报错：
        var stringValue : String
        //error: variable 'stringValue' used before being initialized
        //let hashValue = stringValue.hashValue
       
        
        // 这个字符串是完全由数字组成的
        let possibleNumber = "123"
        // convertedNumber 被推测为类型 "Int?"， 或者类型 "optional Int"
        // 这里调用toInt()方法时，转换可能会失败，所以返回的是Optional类型，也就是Int?类型，
        // 相当于Optional<Int>，返回值是说：要么有整型值，要么根本就没有值
        // 因为这里possibleNumber完全是由数字组成的字符串，所以转换成功，因此得到整型值123
        let convertedNumber = possibleNumber.toInt()
        println(convertedNumber)
        
        let possiblesStr = "hello, world"
        let convertedString = possiblesStr.toInt()
        println(convertedString)
        // 这里调用toInt()方法时，转换可能会失败，所以返回的是Optional类型，也就是Int？类型，
        // 因为这里的originalString不是由数字组成的，所以转换失败，返回值就是没有值
        
        /**
        *  Optional其实是个enum，里面有None和Some两种类型。其实所谓的nil就是Optional.None, 非nil就是Optional.Some, 然后会通过Some(T)包装（wrap）原始值，这也是为什么在使用Optional的时候要拆包（从enum里取出来原始值）的原因，这里是enum Optional的定义：
        enum Optional<T> : LogicValue, Reflectable {
           case None
          case Some(T)
          init()
            init(_ some: T)
        }
        声明为Optional只需要在类型后面紧跟一个?即可。如:
        
        var strValue: String?   //?相当于下面这种写法的语法糖
        var strValue: Optional<String>
        翻译成大白话是“它可能包含一个String值，也可能什么都不包含”，也就是说实际上我们声明的是Optional类型，而不是声明了一个String类型，注意一旦声明为Optional的，如果不显式的赋值就会有个默认值nil。判断一个Optional的值是否有值，可以用if来判断：
        一旦声明为Optional的，如果不显式的赋值就会有个默认值nil。判断一个Optional的值是否有值，可以用if来判断：
        
        if strValue {
        //do sth with strValue
        }
        然后怎么使用Optional值呢？文档中也有提到说，在使用Optional值的时候需要在具体的操作，比如调用方法、属性、下标索引等前面需要加上一个?，如果是nil值，也就是Optional.None，会跳过后面的操作不执行，如果有值，就是Optional.Some，可能就会拆包(unwrap)，然后对拆包后的值执行后面的操作，来保证执行这个操作的安全性，比如：
        
        let hashValue = strValue?.hashValue
        strValue是Optional的字符串，如果strValue是nil，则hashValue也为nil，如果strValue不为nil，hashValue就是strValue字符串的哈希值(其实也是用Optional wrap后的值)
        
        另外，?还可以用在安全地调用protocol类型方法上，比如：
        @objc protocol Downloadable {
        @optional func download(toPath: String) -> Bool;
        }
        
        @objc class Content: Downloadable {
        //download method not be implemented
        }
        
        var delegate: Downloadable = Downloadable()
        delegate.download?("some path")
        因为上面的delegate是Downloadable类型的，它的download方法是optional，所以它的具体实现有没有download方法是不确定的。Swift提供了一种在参数括号前加上一个?的方式来安全地调用protocol的optional方法。
        
        另外如果你需要像下面这样向下转型(Downcast)，可能会用到 as?：
        
        if let dataSource = object as? UITableViewDataSource {
        let rowsInFirstSection  = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        }
        到这里我们看到了?的几种使用场景:
        1.声明Optional值变量
        2.用在对Optional值操作中，用来判断是否能响应后面的操作
        3.用于安全调用protocol的optional方法
        4.使用 as? 向下转型(Downcast)
        另外，对于Optional值，不能直接进行操作，否则会报错：
        
        //error: 'String?' does not have a member named 'hashValue'
        //let hashValue = strValue.hashValue
        let hashValue = strValue.hashValue
        上面提到Optional值需要拆包(unwrap)后才能得到原来值，然后才能对其操作，那怎么来拆包呢？拆包提到了几种方法，一种是Optional Binding， 比如：
        
        if let str = strValue {
        let hashValue = str.hashValue
        }
        还有一种是在具体的操作前添加!符号，好吧，这又是什么诡异的语法?!
        
        直接上例子，strValue是Optional的String：
        
        let hashValue = strValue!.hashValue
        这里的!表示“我确定这里的的strValue一定是非nil的，尽情调用吧” ，比如这种情况:
        
        if strValue {
        let hashValue = strValue!.hashValue
        }
        {}里的strValue一定是非nil的，所以就能直接加上!，强制拆包(unwrap)并执行后面的操作。 当然如果不加判断，strValue不小心为nil的话，就会出错，crash掉。
        
        考虑下这一种情况，我们有一个自定义的MyViewController类，类中有一个属性是myLabel，myLabel是在viewDidLoad中进行初始化。因为是在viewDidLoad中初始化，所以不能直接声明为普通值：var myLabel : UILabel，因为非Optional的变量必须在声明时或者构造器中进行初始化，但我们是想在viewDidLoad中初始化，所以就只能声明为Optional：var myLabel: UILabel?, 虽然我们确定在viewDidLoad中会初始化，并且在ViewController的生命周期内不会置为nil，但是在对myLabel操作时，每次依然要加上!来强制拆包(在读取值的时候，也可以用?，谢谢iPresent在回复中提醒)，比如:
        
        myLabel!.text = "text"
        myLabel!.frame = CGRectMake(0, 0, 10, 10)
        ...
        对于这种类型的值，我们可以直接这么声明：var myLabel: UILabel!, 果然是高(hao)大(gui)上(yi)的语法!, 这种是特殊的Optional，称为Implicitly Unwrapped Optionals, 直译就是隐式拆包的Optional，就等于说你每次对这种类型的值操作时，都会自动在操作前补上一个!进行拆包，然后在执行后面的操作，当然如果该值是nil，也一样会报错crash掉。
        
        var myLabel: UILabel!  //!相当于下面这种写法的语法糖
        var myLabel: ImplicitlyUnwrappedOptional<UILabel>
        那么!大概也有两种使用场景
        1.强制对Optional值进行拆包(unwrap)
        2.声明Implicitly Unwrapped Optionals值，一般用于类中的属性
        */
        
        
        /*
        If 语句与强制拆包
        可以使用if语句来检测optional是否包含值，如果包含值，就表示true,如果根本没有值，就表示false.
        当我们确定optional包含值，可以使用!来访问，这个！放在这个optional名字后面。这个！表明：我知道这个
        optional一定有值，请使用它。这就是所谓的：可选值的强制拆包（forced upwrapping of the optional's value）
        看下面的例子：
        */
        // convertedNumber is an optional value
        // 如果convertedNumber存在值，那么表达式就是true
        if (convertedNumber != nil) {
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
        // 这个optional是String?类型，初始值为404
        var serverResponseCode: String? = "404"
        // 把serverResponseCode设置为nil后，serverResponseCode现在不再有值，也就是Optional.None
        serverResponseCode = nil
        //注意：使用!来获取一个不存在的可选值会导致运行时错误。使用!来强制解析值之前，一定要确定可选包含一个非nil的值
        //var  intResult = serverResponseCode!.toInt()
        
//        可选绑定（optional binding）
//        我们可以使用optional binding来判断这个optional 是否包含一个值，确保值是可用的，并作为临时常量或者变量的值。
//        Optional binding可以使用if 和 while 语句中，用来检测optional是否包含值，并取出其中的值给常量或者变量。optional
//        binding的写法是：
        
//        if let constantName = someOptional {
//            statements
//        }
        
        var number = "123"
        if let actualNumber = number.toInt() {
            println("\(possibleNumber) has an integer value of \(actualNumber)")
        } else {
            println("\(possibleNumber) could cant be converted to an integer")
        }
        

        
//        如果在代码中不确定这个变量或者常量是否有值，那么就声明为optional。
//        如果在定义Optional常量或者变量时，没有给定初始值，那么会自动设置为nil,表示Optional.None,即没有值。
        // surveyAnswer的值就是nil
         var surveyAnswer: String?
//        SWIFT中的nil不同与OC中的nil，在OC中，nil表示不存在的对象。在Swit中，nil不是指针，只是表示某种类型的值不存在，
//        optional可以设置任何类型值为nil，不仅仅是对象类型。
//        
//        隐式拆包可选值(Implicitly Unwrapped Optionals)
//        每次都要判断和解析可选值是非常低效的，因为可以确定它总会有值,有时候，我们可以确定一旦变量或者常量被创建并初始化后，一直都会有值，那么可以就可以使用隐式拆包方式获取值。
//        在声明变量时，不是使用？来声明可选值，而是使用！来声明。
        let possibleString: Optional<String> = "An optional string."
        println(possibleString!)
        
        let assumedString: String! = "An implicitly unwrapped optional string."
        // 不需要添加！来拆包
        println(assumedString)
        
//        如果尝试访问的隐式拆包可选值不包含值，会触发运行时错误。
//        一旦声明为Optional的，如果不显式的赋值就会有个默认值nil。判断一个Optional的值是否有值，使用if或者while 判断隐式拆包可选值是否包含值，如果包含值，会返回true,否则返回false
        
        if (assumedString != nil) {
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
        
        //nil是一个对象指针为空，Nil是一个类指针为空，NULL是基本数据类型为空
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
