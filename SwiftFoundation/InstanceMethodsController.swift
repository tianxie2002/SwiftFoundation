//
//  InstanceMethodsController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit


//Count类定义了3个实例方法，通过点操作符调用
class Counter {
    var count = 0
    func increment() {
        count++
    }
    func incrementBy(amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
   
}


struct LevelTracker {
    static var highestUnlockedLevel = 1
    static func unlockLevel(level: Int) {
        if level > highestUnlockedLevel { highestUnlockedLevel = level }
    }
    static func levelIsUnlocked(level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    var currentLevel = 1
    mutating func advanceToLevel(level: Int) -> Bool {
        if LevelTracker.levelIsUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func completedLevel(level: Int) {
        LevelTracker.unlockLevel(level + 1)
        tracker.advanceToLevel(level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

class InstanceMethodsController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
        /**
        *  1.实例方法 (Instance Methods)
        实例方法是属于某个特定类、结构体或者枚举类型实例的方法，提供访问和修改实例属性的方法或提供与实例目的相关的功能，语法与函数一致
        实例方法写在类里面，能够访问所属类型的其他方法和属性，只能被它所属类的特定实例调用
        */
        let counter = Counter()
        // the initial counter value is 0
        counter.increment()
        // the counter's value is now 1
        counter.incrementBy(5)
        // the counter's value is now 6
        counter.reset()
        // the counter's value is now 0
        
        /**
        *  3.self属性
        类型的每个实例都有一个隐藏的属性self，等同于实例本身，但其实只要在一个方法中使用一个已知的属性或方法，即使没有明确的写出self，Swift也会假定是当前的，但是如果实例方法的某个参数名称与实例的某个属性名称相同时，这种情况下参数名称享有优先权，这时需要self来区分参数名称和属性名称
        */
        //以下例子使用self消除参数x和实例属性x之间的歧义
        struct Point {
            var x = 0.0, y = 0.0
            func isToTheRightOfX(x: Double) -> Bool {
                return self.x > x
            }
            mutating func moveByX(deltaX: Double, y deltaY: Double) {
                x += deltaX
                y += deltaY
            }
            // 在 mutating 方法中给self赋值
            // mutating方法给self赋了一个新的实例，并在方法结束后替换原有的实例，以下例子和上一例子其实是一样的
//            mutating func moveByX(deltaX: Double, y deltaY: Double) {
//                self = Point(x: x + deltaX, y: y + deltaY)
//            }
        }
        let point = Point(x: 4.0, y: 5.0)
        if point.isToTheRightOfX(1.0) {
            println("This point is to the right of the line where x == 1.0")
        }
        // prints "This point is to the right of the line where x == 1.0"
        
        /**
        *  结构体和枚举是值类型，一般不允许在实例方法中修改值类型的属性，但是可以使用 (mutating) 这个方法，然后方法从内部改变它的属性，并且所做的改变在方法结束时都还保留在原始结构中
        *
        */
        
    
        var somePoint = Point(x: 1.0, y: 1.0)
        somePoint.moveByX(2.0, y: 3.0)
        println("The point is now at (\(somePoint.x), \(somePoint.y))")
        // prints "The point is now at (3.0, 4.0)"
        // 不能在结构体类型常量中调用 mutating 方法，因为常量属性不可改变，即使是常量的变量属性也不行
        let fixedPoint = Point(x: 3.0, y: 3.0)
        //fixedPoint.moveByX(2.0, y: 3.0)
        // this will report an error
        
        
        //枚举的 mutating方法把self设置为相同的枚举类型中不同的成员
        enum TriStateSwitch {
            case Off, Low, High
            mutating func next() {
                switch self {
                case Off:
                    self = Low
                case Low:
                    self = High
                case High:
                    self = Off  
                }  
            }  
        }
        var ovenLight = TriStateSwitch.Low
        ovenLight.next()
        // ovenLight is now equal to .High
        ovenLight.next()
        // ovenLight is now equal to .Off
      
        

        
        
        var player = Player(name: "Argyrios")
        player.completedLevel(1)
        println("highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")
        // prints "highest unlocked level is now 2"
        
        player = Player(name: "Beto")
        if player.tracker.advanceToLevel(6) {
            println("player is now on level 6")
        } else {
            println("level 6 has not yet been unlocked")  
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
