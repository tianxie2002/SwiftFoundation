//
//  InitializationController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit


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
//指定构造器和便利构造器的语法
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
    convenience init(name: String) {
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

class InitializationController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        struct Fahrenheit {
            var temperature: Double
            init() {
                temperature = 32.0
            }
        }
        var f = Fahrenheit()
        println("The default temperature is \(f.temperature)° Fahrenheit")
        // prints "The default temperature is 32.0° Fahrenheit"
        
       
        struct Celsius {
            var temperatureInCelsius: Double = 0.0
            init(fromFahrenheit fahrenheit: Double) {
                temperatureInCelsius = (fahrenheit - 32.0) / 1.8
            }
            init(fromKelvin kelvin: Double) {
                temperatureInCelsius = kelvin - 273.15
            }
        }
        let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
        // boilingPointOfWater.temperatureInCelsius is 100.0
        let freezingPointOfWater = Celsius(fromKelvin: 273.15)
        // freezingPointOfWater.temperatureInCelsius is 0.0
        
        
        /**
        *  构造函数存在一个构造器内部使用的参数名和一个在调用时使用的外部参数名，如果没有提供参数的外部名字，Swift会自动为每个构造器的参数生成一个跟内部参数名相同的外部参数名
        */
        struct Color {
            let red = 0.0, green = 0.0, blue = 0.0
            init(red: Double, green: Double, blue: Double) {
                self.red   = red
                self.green = green
                self.blue  = blue
            }
        }
        let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
        // 如果不通过外部参数名传值，编译时无法通过
        //let veryGreen = Color(0.0, 1.0, 0.0)
        // this reports a compile-time error - external names are required
        
        
        let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
        cheeseQuestion.ask()
        // prints "Do you like cheese?"
        cheeseQuestion.response = "Yes, I do like cheese."
        
        
        // 尽管text属性是常量，但在构造过程之中还是可以修改的，构造过程结束时候不能再修改了
        
        let beetsQuestion = SurveyQuestion(text: "How about beets?")
        beetsQuestion.ask()
        // prints "How about beets?"
        beetsQuestion.response = "I also like beets. (But not with cheese.)"
        
        let namedMeat = Food(name: "Bacon")
        // namedMeat's name is "Bacon"
        
        let mysteryMeat = Food()
        // mysteryMeat's name is "[Unnamed]"
        
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
            let boardColors: Bool[] = {
                var temporaryBoard = Bool[]()
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
