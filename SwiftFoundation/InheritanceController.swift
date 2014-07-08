//
//  InheritanceController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  继承
一个类可以继承另一个类的方法，属性和其他特特性，继承类叫子类，被继承叫父类，Swift中，类可以调用和访问父类的方法，属性和附属脚本，并且可以重写来修改他们的行为
*/

//不继承与其他类的类，称为基类
class Vehicle {
    var numberOfWheels: Int
    var maxPassengers: Int
    func description() -> String {
        return "\(numberOfWheels) wheels; up to \(maxPassengers) passengers"
    }
    init() {
        numberOfWheels = 0
        maxPassengers = 1
    }
}

// Bicycle继承了Vehicle的属性和方法
class Bicycle: Vehicle {
    init() {
        super.init()
        numberOfWheels = 2
    }
}

// 子类可以继续被其他类继承
class Tandem: Bicycle {
    init() {
        super.init()
        maxPassengers = 2
    }
}

class Car: Vehicle {
    var speed: Double = 0.0
    init() {
        super.init()
        maxPassengers = 5
        numberOfWheels = 4
    }
    override func description() -> String {
        return super.description() + "; "
            + "traveling at \(speed) mph"
    }
}

// min函数是Swift标准库中的一个全局函数，接收两个或多个参数，返回最小的那个
class SpeedLimitedCar: Car {
    override var speed: Double  {
    get {
        return super.speed
    }
    set {
        super.speed = min(newValue, 40.0)
    }
    }
}

class AutomaticCar: Car {
    var gear = 1
    override var speed: Double {
    didSet {
        gear = Int(speed / 10.0) + 1
    }
    }
    override func description() -> String {
        return super.description() + " in gear \(gear)"
    }
}


class InheritanceController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let bicycle = Bicycle()
        println("Bicycle: \(bicycle.description())")
        // Bicycle: 2 wheels; up to 1 passengers
        
        let car = Car()
        println("Car: \(car.description())")
        // Car: 4 wheels; up to 5 passengers; traveling at 0.0 mph
        
        
        let limitedCar = SpeedLimitedCar()
        limitedCar.speed = 60.0
        println("SpeedLimitedCar: \(limitedCar.description())")
        // SpeedLimitedCar: 4 wheels; up to 5 passengers; traveling at 40.0 mph
        
        
        /**
        *  注意：
        你不可以为继承来的常量存储型属性或继承来的只读计算型属性添加属性观察器。这些属性的值是不可以被设置的，所以，为它们提供willSet或didSet实现是不恰当。此外还要注意，你不可以同时提供重写的 setter 和重写的属性观察器。如果你想观察属性值的变化，并且你已经为那个属性提供了定制的 setter，那么你在 setter 中就可以观察到任何值变化了。
        */
        let automatic = AutomaticCar()
        automatic.speed = 35.0
        println("AutomaticCar: \(automatic.description())")
        // AutomaticCar: 4 wheels; up to 5 passengers; traveling at 35.0 mph in gear 4
        
        
        //使用 @final 来防止被子类重写( @final var , @final func, @final class func, @final subscript)
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
