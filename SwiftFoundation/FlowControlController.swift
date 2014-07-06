//
//  FlowControlController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class FlowControlController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        控制流
        for for-in while do-while
        */
        
        let count = 5
        for var i = 0; i < count; i++ {
            print("\(i)")
        }
        
        for i in 0..count {
            print("\(i)")
        }
        
        let base = 4
        let power = 10
        var answer = 1
        // 使用_来忽略某个值
        for _ in 1...power {
            answer *= base
        }
        
        // 访问数组
        let names = ["Anna", "Alex", "Brian", "Jack"]
        for name in names {
            println("Hello, \(name)")
        }
        
        // 访问字典
        var airports = ["T": "Tokyo", "D": "Doubin"]
            for (key, value) in airports {
            println("\(key)s is \(value) legs")
            }
            
            // 循环遍历字符串
            for c in "Hello" {
            println(c)
        }
        
        var index: Int
        for index = 0; index < 4; ++index {
            println("Index is \(index)")
        }
        
        
        // while循环
        let timesWhile = 10
        var countWhile = 0
        while countWhile < timesWhile {
            println("\(countWhile++)")
        }
        
        // do-while循环
        let timesDo = 10
        var countDo = 0
        do {
            countDo++
            println("\(count)")
        } while countDo < timesDo
        
        
        
        // switch 语句在swift中与C和OC中是不同的，在Swift中匹配到一个Case后，不需要添加break,
        // 也会在执行完匹配的那一项后自动Break。
        let c = "a"
        switch c {
        case "a" : print("a")
        case "b" : print("b")
        case "c" : print("c")
        default: print("default")
        }
        // print a
        
        // 范围匹配
        let countNum = 1_000_000
        var msg: String
        switch countNum {
        case 0: msg = "no"
        case 1...3: msg = "a few"
        case 10...99: msg = "lower than one hundred"
        case 100...999: msg = "lower than one thousand"
        case 1000...9999: msg = "lower than then thousand"
        case 10000...99999: msg = "lower than one million"
        default: msg = "no value"
        }
        
        // 值绑定（Value Binding）
        let anotherPoint = (2, 0)
        // 这就是所谓的值绑定，通过值赋给临时常量或者变量
        switch anotherPoint {
        case (let x, 0): // 这里不需要修改x的值，所以声明为let，即常量
        println("on the x-axis with an x value of \(x)")
        case (0, let y):
            println("on the y-axis with a y value of \(y)")
        case let (x, y): // 对于这里，没有使用Default，其实这里这么写法就相当于default:
            println("somewhere else at (\(x), \(y))")
        }
        
        // 使用where语句来检测额外的条件
        let yetAnotherPoint = (1, -1)
        switch yetAnotherPoint {
        case let (x, y) where x == y: // 使用值绑定，要求x与y相等
            println("(\(x), \(y)) is on the line x == y")
        case let (x, y) where x == -y:// 使用值绑定，要求x与-y相等
            println("(\(x), \(y)) is on the line x == -y")
        case let (x, y):// 使用值绑定,相当于default
            println("(\(x), \(y)) is just some arbitrary point")
        }
        
        /*
        continue
        break
        falthrough
        return
        */
        // continue、break、return跟C、OC中的continue、break、return是一样的
        let puzzleInput = "great minds think alike"
        var puzzleOutput = ""
        for c in puzzleInput {
            switch c {
            case "a", "e", "i", "o", "u":// 相当于遇到这几种字符就会就会继续循环而不往下执行
                continue
            default:
                puzzleOutput += c
            }
        }
        
        let numberSymbol: Character = "三"
        var possibleIntegerValue: Int?
        switch numberSymbol {
        case "1", "一":
            possibleIntegerValue = 1
        case "2", "二":
            possibleIntegerValue = 2
        default:
            break
        }
        
        let integerToDescribe = 5
        var descripton = "The number \(integerToDescribe) is"
        switch integerToDescribe {
        case 2, 3, 5, 7, 9, 11, 13, 17, 19:
            descripton += "a prime number, and also"
            fallthrough // 加上falthrough，就会继续往下执行，执行default这里的语句
        default:
            descripton += " an integer"
        }
        // print: The number 5 is a prime number, and also an integer 
        
        // 可以给循环添加标签
        var integerValue = 0
        let countValue = 10
        GameLoopLabel: while integerValue < countValue {
            switch integerValue {
            case integerValue % 2 == 0: 
                break GameLoopLabel // 调用此语句后，就退出了while循环
            case let inValue where (inValue > 5 && inValue % 2 != 0):
                continue GameLoopLabel
            default:
                println("run default")
                break GameLoopLabel
            }
        }

        // Do any additional setup after loading the view.
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
