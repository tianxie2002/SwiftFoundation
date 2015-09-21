//
//  InitializationController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

/**
*  可选属性类型
    如果你定制的类型包含一个逻辑上允许取值为空的存储型属性--不管是因为它无法在初始化时赋值，还是因为它可以在之后某个时间点可以赋值为空--你都需要将它定义为可选类型optional type。可选类型的属性将自动初始化为空nil，表示这个属性是故意在初始化时设置为空的。
*/
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        println(text)
    }
}

/**
//指定构造器和便利构造器的语法  Designated Initializers and Convenience Initializers
摘录来自: Apple Inc. “The Swift Programming Language”。 iBooks. https://itunes.apple.com/cn/book/swift-programming-language/id881256329?mt=11
指定构造器是类中最主要的构造器。一个指定构造器将初始化类中提供的所有属性，并根据父类链往上调用父类的构造器来实现父类的初始化。
每一个类都必须拥有至少一个指定构造器。在某些情况下，许多类通过继承了父类中的指定构造器而满足了这个条件。具体内容请参考后续章节自动构造器的继承。
便利构造器是类中比较次要的、辅助型的构造器。你可以定义便利构造器来调用同一个类中的指定构造器，并为其参数提供默认值。你也可以定义便利构造器来创建一个特殊用途或特定输入的实例。
你应当只在必要的时候为类提供便利构造器，比方说某种情况下通过使用便利构造器来快捷调用某个指定构造器，能够节省更多开发时间并让类的构造过程更清晰明了。
  构造器链
为了简化指定构造器和便利构造器之间的调用关系，Swift 采用以下三条规则来限制构造器之间的代理调用：

规则 1 指定构造器必须调用其直接父类的的指定构造器。
规则 2 便利构造器必须调用同一类中定义的其它构造器。
规则 3 便利构造器必须最终以调用一个指定构造器结束。

一个更方便记忆的方法是：
指定构造器必须总是向上代理 便利构造器必须总是横向代理
*/
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}

class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    convenience  override init(name: String) {
        self.init(name: name, quantity: 1)
    }
}

class ShoppingListItem: RecipeIngredient {
    var purchased = false
    var description: String {
    var output = "\(quantity) x \(name.lowercaseString)"
        output += purchased ? " ✔" : " ✘"
        return output
    }
}

/**
*  温度的转换
*/
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
/**
*  颜色的结构
*/
struct Color {
    let red = 0.0, green = 0.0, blue = 0.0
    init(red: Double, green: Double, blue: Double) {
        self.red   = red
        self.green = green
        self.blue  = blue
    }
}


struct SizeInit {
    var width = 0.0, height = 0.0
}
struct Celsius {
    var temperatureInCelsius: Double = 0.0
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
class InitializationController: BaseViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println("---------------------------------构造过程------------------------------------------------------")
        /**
        *  类和结构体在实例创建时，必须为所有存储型属性设置合适的初始值。存储型属性的值不能处于一个未知的状态。
        *  构造器在创建某特定类型的新实例时调用。它的最简形式类似于一个不带任何参数的实例方法，以关键字init命名。
        */
        var f = Fahrenheit()
        println("The default temperature is \(f.temperature)° Fahrenheit")
        // prints "The default temperature is 32.0° Fahrenheit"
        
        
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        // boilingPointOfWater.temperatureInCelsius is 100.0
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        // freezingPointOfWater.temperatureInCelsius is 0.0
        
        
        /**
        *  构造函数存在一个构造器内部使用的参数名和一个在调用时使用的外部参数名，如果没有提供参数的外部名字，Swift会自动为每个构造器的参数生成一个跟内部参数名相同的外部参数名
        */
               let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
        // 如果不通过外部参数名传值，编译时无法通过
        //let veryGreen = Color(0.0, 1.0, 0.0)
        // this reports a compile-time error - external names are required
        
        
        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        // prints "Do you like cheese?"
        cheeseQuestion.response = "Yes, I do like cheese."
        
        
        /* 尽管text属性是常量，但在构造过程之中还是可以修改的，构造过程结束时候不能再修改了
           注意：对某个类实例来说，它的常量属性只能在定义它的类的构造过程中修改；不能在子类中修改。
        */
        
        let beetsQuestion = SurveyQuestion(text: "How about beets?")
        beetsQuestion.ask()
        // prints "How about beets?"
        beetsQuestion.response = "I also like beets. (But not with cheese.)"
        
        let namedMeat = Food(name: "Bacon")
        // namedMeat's name is "Bacon"
        
        let mysteryMeat = Food()
        // mysteryMeat's name is "[Unnamed]"
        /**
        *  除上面提到的默认构造器，如果结构体对所有存储型属性提供了默认值且自身没有提供定制的构造器，它们能自动获得一个逐一成员构造器。
        逐一成员构造器是用来初始化结构体新实例里成员属性的快捷方法。我们在调用逐一成员构造器时，通过与成员属性名相同的参数名进行传值来完成对成员属性的初始赋值。
        */
        let twoByTwo = SizeInit(width: 2.0, height: 2.0)
        
        let oneMysteryItem = RecipeIngredient()
        let oneBacon = RecipeIngredient(name: "Bacon")
        let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
        
        
        var breakfastList = [
            ShoppingListItem(),
            ShoppingListItem(name: "Bacon"),
            ShoppingListItem(name: "Eggs", quantity: 6),
        ]
        breakfastList[0].name = "Orange juice"
        breakfastList[0].purchased = true
        for item in breakfastList {
            println(item.description)  
        }
        
        
        //闭包结尾的大括号后接空得小括号，告诉Swift立刻执行此闭包，如果忽略这个括号，相当于闭包本身作为值赋给属性，而不是将闭包的返回值赋给属性
//        class SomeClass {
//            let someProperty: SomeType = {
//                // create a default value for someProperty inside this closure
//                // someValue must be of the same type as SomeType
//                return someValue
//                }()
//        }
        
        struct Checkerboard {
            let boardColors: [Bool] = {
                var temporaryBoard = [Bool]()
                var isBlack = false
                for i in 1...10 {
                    for j in 1...10 {
                        temporaryBoard.append(isBlack)
                        isBlack = !isBlack
                    }
                    isBlack = !isBlack
                }
                return temporaryBoard
                }()
            func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
                return boardColors[(row * 10) + column]
            }
        }
        
        let board = Checkerboard()
        println(board.squareIsBlackAtRow(0, column: 1))
        // prints "true"
        println(board.squareIsBlackAtRow(9, column: 9))
        // prints "false"
        
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
