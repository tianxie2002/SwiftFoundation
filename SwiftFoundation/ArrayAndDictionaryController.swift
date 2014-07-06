//
//  ArrayAndDictionaryController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
import Foundation
class ArrayAndDictionaryController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        /* Swift 提供了两种集合类型，即数组(Array)和字典(Dictionary),存储值的集合
        数组存储相同类型的顺序列表值。字典存储无序同类型值的集合，通过键来查询和
        引用。
        在Swift中，数组和字典总是值和键的存储类型是明确的。这意味着不能插入错误的类型到字典
        和数组中。这种显示类型可以保证你的代码中值的类型总是明确的。
        */
        // 数组类型全型为Array<SomeType>，也可以使用SomeType[]这种写法。虽然这两种类型是一样的，但
        // 后者更佳，并且都会使用后者。
        var shoppingList: String[] = ["Egg", "Milk"]
        // 访问和修改数组元素
        println("The shopping list contains \(shoppingList.count) items")
        
        // 判断数组是否是空数组
        if shoppingList.isEmpty {
            println("Empty array")
        } else {
            println("Non empty array")
        }
        
        // 追加元素 可以使用append方法 ，可以使用+=
        shoppingList.append("Flour") // 变成：["Egg", "Milk", "Flour"]
        shoppingList += "Baking Power" // 变成：["Egg", "Milk", "Flour", "Baking Power"]
        
        // 通过下标访问元素
        var firstItem = shoppingList[0] // Egg
        // 通过下标修改元素
        shoppingList[0] = "Six eggs" // 把Egg变成了Six eggs
        // 通过范围下标修改
        shoppingList[1..3] = ["Egg", "Eggg"] // ["Egg", "Eggg", "Flour", "Baking Power"]
        shoppingList[1...3] = ["Egg", "Eggg", "Egggg"] // ["Egg", "Eggg", "Egggg", "Baking Power"]
        
        // 通过insert方法在指定下标插入元素
        //变成：["InsertedValue", "Egg", "Eggg", "Egggg", "Baking Power"]
        shoppingList.insert("InsertedValue", atIndex: 0)
        
        // 通过removeAtIndex移除某个元素
        // 执行后，变成： ["Egg", "Eggg", "Egggg", "Baking Power"]
        let removedObj = shoppingList.removeAtIndex(0)
        
        // 移除最后一个元素
        // 方式一：
        var lastObj = shoppingList.removeLast()
        // 方式二：
       // var lastObj = shoppingList.removeAtIndex(shoppingList.cout - 1)
        
        // 循环迭代数组
        for item in shoppingList {
            println(item)
        }
        
        // 使用了全局函数enumerate
        for (index, value) in enumerate(shoppingList) {
            println("Item at index \(index + 1) is \(value)")
        }
        
        // 创建和初始化数组
        var shomInts = Int[]() // 创建空数组，元素的个数为0
        // 调用初始化器
        var threeDoubles = Double[](count: 3, repeatedValue: 0.0)
        // 通过类型自动推测，不用指定特定类型
        var anotherThreeDoubles = Array(count: 3, repeatedValue: 2.4)
        // 两个数组相加,新数组的类型会根据这两个数组的类型推断出来
        var sixDoubles = threeDoubles + anotherThreeDoubles
        
        
        
        
        
        /* 字典
        字典是存储多个相同类型值的容器。每个值都有一个与之关联的唯一键作为该值在该字典中的唯一标识。
        字典中的元素是无序的，与数组不同。当我们需要基于标识来查询值时，我们会使用字典。Swift中的字典
        中的键和值的类型必须是明确的，类型为：Dictionary<KeyType, ValueType>,其中KeyType就是键的类型，
        而ValueType就是值的类型。对字典的键的唯一限制是这个KeyType必须是可哈希的类型。Swift中的所有基本
        数据类型都是可哈希的，这些基本类型都可以作为字典的值。
        */
        // 创建空字典
        var emptyDict = Dictionary<String, String>()
        // 初始化
        var airports: Dictionary<String, String> = ["T": "Tokyo", "D": "Doubin"]
        // 如果初始化，可以不明确指明类型，可以自动根据初始值推测出来
        var ariports = ["T": "Tokyo", "D": "Doubin"]
        
        // 访问和修改字典元素
        println("The dictionary of airports contains \(airports.count) items")
        // 添加新键值对
        ariports["L"] = "London"
        // 通过已经存在的键，修改对应的值
        airports["L"] = "London Heathrow"
        // 可以通过updateValue(forKey:)添加或者修改元素
        if let oldValue = airports.updateValue("Dubin Internation", forKey:"D") {
            println("The old value for D was \(oldValue)")
        }
        
        // 通过下标键获取对应的值，返回的是一个Optional类型值,通过optional binding拆包
        if let airportName = airports["D"] {
            println("The name of the airport is \(airportName)")
        } else {
            println("That airport is not in the airports dictionary")
        }
        
        // 通过下标键移除键值对，只需要设置为nil 这种方式Xcode 会报错
       // airports["A"] = "Apple International"
        //airport["L"] = nil // 移除
        
        // 可以通过removeValueForKey移除
        if let removeValue = airports.removeValueForKey("D") {
            println("The remove airport's name is \(removeValue)")
        } else {
            println("The airports dictionary does not contain a value for D")
        }
        
        // 通过键值对迭代字典
        for (key, airportName) in airports {
            println("\(key): \(airportName)")
        }
        
        for key in airports.keys {
            println("Airport code: \(key)")
        }
        
        for airportName in airports.values {
            println("Airport name: \(airportName)")
        }
        
        // 把字典所有的值或者键存储到数组中
        //let airportCodes = Array(airports.keys)
        //let airportNames = Array(airport.values)
        
        // 创建空字典
        var namesOfIntegers = Dictionary<Int, String>()
        namesOfIntegers[10] = "ten" // 有一个键值对
        namesOfIntegers = [:] // 又变成空字典了，由于前面已经指定过类型了，这里可以重复不指定

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
