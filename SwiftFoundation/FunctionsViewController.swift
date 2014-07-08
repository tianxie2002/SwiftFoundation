//
//  FunctionsViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

/*
函数（Function）
函数是为执行特定功能的自包含的代码块。函数需要给定一个特定标识符（名字），然后当需要的时候，
就调用此函数来执行功能。
*/
class FunctionsViewController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    // 函数的定义与调用
    // 定义函数时，使用关键字func，返回值类型通过->指明，如下：
    // 函数名：sayHello，
    // 参数列表中只有一个参数，叫personName,参数类型是String
    // 函数返回值类型：String
    func sayHello(personName: String) -> String {
        let greeting = "Hello, " + personName + "!"
        return greeting
    }
    // 简化函数体
    func sayHelloAgain(personName: String) -> String {
        return "Hello, " + personName + "!"
    }
    
    // 函数可以有多个参数
    /*!
    * @brief 返回两个值的差
    * @param start Int类型，范围区间的起点
    * @param end Int类型，范围区间的终点
    * @return 返回值为Int类型，表示终点-起点的值
    */
    func halfOpenRangeLength(start: Int, end: Int) -> Int {
        return end - start
    }
     // 无参数函数
    func sayHelloWorld() -> String {
        return "Hello, world"
    }
    
    // 无返回值的函数,其实这里没有指定返回值，也会返回一个特殊的值，Void
    func sayGoodbye(personName: String) -> Void{
        println("Goodbye, \(personName)!")
    }
    
    // 函数返回值是可以忽略的
    func printAndCount(stringToPrint: String) -> Int {
        println(stringToPrint)
        return countElements(stringToPrint) // 计算字符串的长度
    }
    
    // 不带返回值
    func printWithoutCounting(stringToPrint: String) {
        printAndCount(stringToPrint)
    }
    
    /*
    * @brief 函数可以返回元组（多个值） 元音和辅音 和其他的字符数量
    * @param string 字符串
    * @return (vowels: Int, consonants: Int, others: Int)
    *         vowels:元音， consonants:辅音，others：其它字符
    */
    func count(string: String) ->(vowels: Int, consonants: Int, others: Int) {
        var vowels = 0
        var consonants = 0
        var others = 0
        for c in string {
            switch String(c).lowercaseString {
            case "a", "o", "e", "i", "u":
                ++vowels
            case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
            "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
                ++consonants
            default:
                ++others
            }
        }
        return (vowels, consonants, others)
    }
    
    func joinOne(OhsString lhsString: String, OrhsString rhsString: String, Ojoiner joiner:String) -> String {
        return lhsString + joiner + rhsString
    }
    // 加上#号后，参数名与外部名相同，这是快捷方式
    func joinTwo(#ssString: String, #rsString: String, #sjoiner:String) -> String {
        return ssString + sjoiner + rsString
    }
    // 可以不使用快捷方式
    func joinThree(threeStr: String, threeString: String,  joiner: String) -> String {
        return threeStr + joiner + threeString
    }
    // 函数参数默认值
    // 参数参数可以提供默认值，但是默认值只能是参数列表的最后，也就是说
    // 如果arg1提供默认值，后面的都需要提供默认值。
    func joinFour(#originalString: String, destinationString: String, withJoiner: String = " ") -> String {
        return originalString + withJoiner + destinationString
    }
    // 可变参数
    // 可变参数接受0个或者多个指定类型的值。可变参数使用...表示
    // 函数最多只能有一个可变参数，并且如果有可变参数，这个可变参数必须出现在参数列表的最后
    // 如果参数列表中有一或多个参数提供默认值，且有可变参数，那么可变参数也要放到所有最后一个
    // 提供默认值的参数之后（先是默认值参数，才能到可变参数）
    func arithmeticMean(numbers: Double...) -> Double {
        var total = 0.0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }
    // 常量和变量参数
    // 在函数参数列表中，如果没有指定参数是常量还是变量，那么默认是let，即常量
    // 这里Str需要在函数体内修改，所以需要指定为变量类型，即用关键字var
    func alignRight(var str: String, count: Int, pad: Character) -> String {
        let amountToPad = count - countElements(str)
        
        // 使用_表示忽略，因为这里没有使用到
        for _ in 1...amountToPad {
            str = pad + str
        }
        
        return str
    }
    // 输入/输出参数
    // 有时候，在函数体内修改了参数的值，如何能直接修改原始实参呢？就是使用In-Out参数
    // 使用inout关键字声明的变量就是了
    // 下面这种写法，是不是很像C++中的传引用？
    func swap(inout lhs: Int, inout rhs: Int) {
        let tmp = lhs
        lhs = rhs
        rhs = tmp
    }
    // 使用函数类型
    // 这里是返回Int类型
    // 参数类型是：(Int, Int) -> Int
    func addTwoInts(first: Int, second: Int) -> Int {
        return first + second
    }
    // 参数类型是：(Int, Int) -> Int
    func multiplyTwoInts(first: Int, second: Int) -> Int {
        return first * second
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("---------------------------------函数-------------------------------------------------------")
        
        // 函数调用
        println(sayHello("Anna")) // prints "Hello, Anna"
        println(sayHelloAgain("Brian")) // prints "Hello, Brian"
        
        // 多参形式的
        println(halfOpenRangeLength(1,end: 10)) // prints "9"
        
        // 无参数函数
        println(sayHelloWorld())
        
        // 无返回值的函数,其实这里没有指定返回值，也会返回一个特殊的值，Void
        sayGoodbye("David")
        // 函数返回值是可以忽略的
        printAndCount("Hello,world")
        // 不带返回值
        printWithoutCounting("hello, world")
        // 返回多个返回值
        let total = count("some arbitrary string!")
        println("\(total.vowels) vowels and \(total.consonants) consonants")
        
        
        // 外部参数名(External Parameter Names)
        // 有时候使用外部参数名是很有用的，这直到提示的作用，就好像OC语法中的参数一样，见名知意  代码可读性
        func someFunction(externalParameterName localParameterName: Int) {
            // do something
        }
        
        // 看例子：
        // 这里调用的时候，外部参数名
        // prints "hello,world"
        println( joinOne(OhsString:"hello", OrhsString:"world",Ojoiner: "-one-"))
       
        println(joinTwo(ssString: "hello", rsString: "world", sjoiner: "-two-"))
        //  可以不使用快捷方式
        println(joinThree("hello", threeString:"world", joiner: "-three-"))
       
        joinFour(originalString: "hello", destinationString: "world", withJoiner: "-") // prints "hello-world"
        joinFour(originalString: "hello", destinationString: "world") // prints "hello world"
        
    
        
       
        
        arithmeticMean(1, 2, 3, 4, 5) // return 3.0
        arithmeticMean(1, 2, 3) // return 2.0
        
        
        
    
        // 如何调用呢？调用的调用，对应的实参前面需要添加&这个符号
        // 因为需要修改，所以一定是var类型的
        var first = 3 
        var second = 4
        // 这种方式会修改实参的值
        swap(&first, rhs: &second) // first = 4, second = 3
        
       
        
        var mathFunction: (Int, Int) -> Int = addTwoInts
        mathFunction(1, 2) // return 3
        mathFunction = multiplyTwoInts
        mathFunction(1, 2) // return 2
        
        // 参数可以作为参数
        func printMathResult(mathFunction: (Int, Int) -> Int, first: Int, second: Int) {
            println("Result: \(mathFunction(first, second))")
        }
        
        printMathResult(addTwoInts, 3, 5) // prints "Result: 8"
        printMathResult(multiplyTwoInts, 3, 5) // prints "Result: 15"
        
        // 函数作为返回类型
        func stepForward(input: Int) -> Int {
            return input + 1
        }
        
        func stepBackward(back: Int) -> Int {
            return back - 1
        }
        
        func chooseStepFunction(backwards: Bool) -> ((Int) -> Int) {
            return backwards ? stepBackward : stepForward
        }
        
        var currentValue = 3
        let moveNearerToZero = chooseStepFunction(currentValue > 0) // call stepBackward() function
        
        // 参数可以嵌套定义，在C、OC中是不可以嵌套的哦
        func chooseStepFunctionTwo(backwards: Bool) -> ((Int) -> Int) {
            func stepForward(input: Int) -> Int {
                return input + 1
            }
            func stepBackward(input: Int) -> Int {
                return input + 1
            }
            return backwards ? stepBackward : stepForward 
        }
        println("---------------------------------函数-------------------------------------------------------")
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
