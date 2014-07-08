//
//  PropertiesController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class StepCounter {
    var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
        println("About to set totalSteps to \(newTotalSteps)")
    }
    didSet {
        if totalSteps > oldValue  {
            println("Added \(totalSteps - oldValue) steps")
        }
    }
    }
}

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
    didSet {
        if currentLevel > AudioChannel.thresholdLevel {
            // cap the new audio level to the threshold level
            currentLevel = AudioChannel.thresholdLevel
        }
        if currentLevel > AudioChannel.maxInputLevelForAllChannels {
            // store this as the new overall maximum input level
            AudioChannel.maxInputLevelForAllChannels = currentLevel
        }
    }
    }
}

//使用关键字static定义值类型的类型属性，class定义类
struct SomeStructure {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
    return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value."
    static var computedTypeProperty: Int {
    return 2
        
    }
}
class SomeClass {
    class var computedTypeProperty: Int {
    return 42
    }
}
class DataImporter {
    /*
    DataImporter is a class to import data from an external file.
    The class is assumed to take a non-trivial amount of time to initialize.
    */
    var fileName = "data.txt"
    
    // the DataImporter class would provide data importing functionality here
}

class DataManager {
    @lazy var importer = DataImporter()
    var data = String[]()
    // the DataManager class would provide data management functionality here
}
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
class PropertiesController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        println("---------------------------------属性-------------------------------------------------------")
        /**
        *  1.存储属性
        存储在类或结构体的实例中的一个变量或常量，可以在定义的时候赋值，也可以在构造过程时候赋值
        */
        // length定义为常量，在创建实例的时候赋值，之后就无法再修改了
        
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        // the range represents integer values 0, 1, and 2
        rangeOfThreeItems.firstValue = 6
        // the range now represents integer values 6, 7, and 8
        
        /**
        *  2.常量
        创建一个结构体的实例并赋值给一个常量，就无法再修改实例的任何属性了，即使有定义变量属性，因为结构体属于值类型，当值类型的实例被声明为常量的时候，所有的属性也就成了常量，跟引用类型的类不一样，类赋值给常量后，仍然可以修改实例的属性
        */
        let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
        // this range represents integer values 0, 1, 2, and 3
        // rangeOfFourItems.firstValue = 6
        // this will report an error, even thought firstValue is a variable property
        
        /**
        *  3.延迟存储属性
        当第一次被调用的时候才会计算其初始值，使用@lazy标志，属性的值在实例构造完成之前可能为空，而常量要求构造完成之前必须有初始值，所以延迟属性必须是变量
        */
        
        // DataImporter在初始化的时候需要消耗不少时间，因为可能要打开文件并读取文件内容，所以在创建DataManager的时候不需要创建DataImporter实例，而是当用到才创建
       
        
        let manager = DataManager()
        manager.data += "Some data"
        manager.data += "Some more data"
        //println(manager.importer)
        // the DataImporter instance for the importer property has not yet been created
        
        //计算属性不直接存储值，提供一个getter来获取，可选的setter来设置
        struct Point {
            var x = 0.0, y = 0.0
        }
        struct Size {
            var width = 0.0, height = 0.0
        }
        struct Rect {
            var origin = Point()
            var size = Size()
            var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set(newCenter) {
                origin.x = newCenter.x - (size.width / 2)
                origin.y = newCenter.y - (size.height / 2)
            }
            }
        }
        var square = Rect(origin: Point(x: 0.0, y: 0.0),
            size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        println("square.origin is now at (\(square.origin.x), \(square.origin.y))")
        // prints "square.origin is now at (10.0, 10.0)"
        
        //如果setter没有定义参数名，则使用默认名称 newValue
        struct AlternativeRect {
            var origin = Point()
            var size = Size()
            var center: Point {
            get {
                let centerX = origin.x + (size.width / 2)
                let centerY = origin.y + (size.height / 2)
                return Point(x: centerX, y: centerY)
            }
            set {
                origin.x = newValue.x - (size.width / 2)
                origin.y = newValue.y - (size.height / 2)
            }
            }
        }
        
        /**
        *  只有getter没有setter的计算属性，总是返回一个值，通过点运算符访问，不能赋新值
        */
        struct Cuboid {
            var width = 0.0, height = 0.0, depth = 0.0
            var volume: Double {
            return width * height * depth
            }
        }
        let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
        println("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
        // prints "the volume of fourByFiveByTwo is 40.0"
        
        
        /**
        *  7.属性监视器
        监控属性值的变化，在属性被设置新值的时候调用，即使新值与原有相同，可以为延迟属性添加监视器，不需要为无法重载的计算属性添加监视器，因为可以通过setter直接监控
        wilSet 在设置新值前调用
        didSet 新的值被设定后调用
        willSet会将新值作为固定参数传入，如果不指定参数，默认使用newValue，didSet会将就值作为参数传入，不指定的话默认参数名为oldValue，如果在didSet监视器为属性设值，那这个值会替换监视器之前设置的值
        willSet和didSet监视器不会在属性初始化的时候调用，只会在属性初始化之后的其他地方比如被设置的时候调用

        */
        
        
        let stepCounter = StepCounter()
        stepCounter.totalSteps = 200
        // About to set totalSteps to 200
        // Added 200 steps
        stepCounter.totalSteps = 360
        // About to set totalSteps to 360
        // Added 160 steps
        stepCounter.totalSteps = 896
        // About to set totalSteps to 896
        // Added 536 steps
        
        
        println(SomeClass.computedTypeProperty)
        // prints "42"
        
        println(SomeStructure.storedTypeProperty)
        // prints "Some value."
        SomeStructure.storedTypeProperty = "Another value."
        println(SomeStructure.storedTypeProperty)
        // prints "Another value."
        
        
        /**
        *  属性监视器 demo
        */
        
        
        var leftChannel = AudioChannel()
        var rightChannel = AudioChannel()
        
        leftChannel.currentLevel = 7
        println(leftChannel.currentLevel)
        // prints "7"
        println(AudioChannel.maxInputLevelForAllChannels)
        // prints "7"
        
        rightChannel.currentLevel = 11
        println(rightChannel.currentLevel)
        // prints "10"
        println(AudioChannel.maxInputLevelForAllChannels)
        // prints "10"
        println("---------------------------------属性-------------------------------------------------------")

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
