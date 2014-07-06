//
//  GenericController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

/**
*  泛型
*/


protocol Container {
    typealias ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}

// IntStack的非泛型版本，实现Container协议的所有三个要求
struct IntStack: Container {
    // original IntStack implementation
    var items = Int[]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    // conformance to the Container protocol
    typealias ItemType = Int
    mutating func append(item: Int) {
        self.push(item)
    }
    var count: Int {
    return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

// 遵循Container协议的泛型版本
struct Stack<T>: Container {
    // original Stack<T> implementation
    var items = T[]()
    mutating func push(item: T) {
        items.append(item)
    }
    mutating func pop() -> T {
        return items.removeLast()
    }
    // conformance to the Container protocol
    mutating func append(item: T) {
        self.push(item)
    }
    var count: Int {
    return items.count
    }
    subscript(i: Int) -> T {
        return items[i]
    }
}

extension Array: Container {

}
class GenericController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // 普通的函数，用来交换两个值
       
        
        var someInt = 3
        var anotherInt = 107
        swapTwoValues(&someInt, b: &anotherInt)
        println("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
        // prints "someInt is now 107, and anotherInt is now 3"
        
        let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
        if let foundIndex = findStringIndex(strings, valueToFind: "llama") {
            println("The index of llama is \(foundIndex)")
        }
        
        let doubleIndex = findIndex([3.14159, 0.1, 0.25], valueToFind: 9.3)
        // doubleIndex is an optional Int with no value, because 9.3 is not in the array
        let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], valueToFind: "Andrea")
        // stringIndex is an optional Int containing a value of 2
        
        
        var stackOfStrings = Stack<String>()
        stackOfStrings.push("uno")
        stackOfStrings.push("dos")
        stackOfStrings.push("tres")
        
        var arrayOfStrings = ["uno", "dos", "tres"]
        
         if allItemsMatch (stackOfStrings, anotherContainer: arrayOfStrings)
        {
            println("All items match.")
        } else {
           println("Not all items match.")
        }
       
    }
    func swapTwoValues<T>(inout a: T, inout b: T) {
        let temporaryA = a
        a = b
        b = temporaryA
    }
//    func swapTwoInts(inout a: Int, inout b: Int) {
//        let temporaryA = a
//        a = b
//        b = temporaryA
//    }
//    func swapTwoStrings(inout a: String, inout b: String) {
//        let temporaryA = a
//        a = b
//        b = temporaryA
//    }
//    
//    func swapTwoDoubles(inout a: Double, inout b: Double) {
//        let temporaryA = a
//        a = b
//        b = temporaryA
//    }
    
    func findStringIndex(array: String[], valueToFind: String) -> Int? {
        for (index, value) in enumerate(array) {
            if value == valueToFind {
                return index
            }
        }
        return nil
    }
    
    
    
    // prints "The index of llama is 2"
    
    
    // 使用泛型实现相同功能，但是下面这个泛型函数不会被编译，在等式 value == valueToFind 里，不是所有的类型都可以用等式 == 来进行比较，如果是自己创建的自定义类型，Swfit就无法猜到这个等于的意思，所以编译下面代码的时候就会报错
//    func findIndex<T>(array: T[], valueToFind: T) -> Int? {
//        for (index, value) in enumerate(array) {
//            if value == valueToFind {
//                return index
//            }
//        }
//        return nil
//    }
    /**
    *  Swift标准库定义了一个Equatable协议，要求任何遵循的类型实现等式 == 和不等式 != 对两个该类型进行比较。所有的Swift标准类型自动支持Equatable协议
    */
    func findIndex<T: Equatable>(array: T[], valueToFind: T) -> Int? {
        for (index, value) in enumerate(array) {
            if value == valueToFind {
                return index
            }
        }
        return nil  
    }
    func allItemsMatch< C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable> (someContainer: C1, anotherContainer: C2) -> Bool {
            
            // check that both containers contain the same number of items
            if someContainer.count != anotherContainer.count {
                return false
            }
            
            // check each pair of items to see if they are equivalent
            for i in 0..someContainer.count {
                if someContainer[i] != anotherContainer[i] {
                    return false
                }
            }
            
            // all items match, so return true
            return true  
            
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
