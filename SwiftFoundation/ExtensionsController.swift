//
//  ExtensionsController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

/**
*  向一个已有的类、结构体或枚举类型添加新功能，包括再没有获取源代码的情况下扩展类型的能力(逆向建模)
*/

extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self / 1_000.0 }
    var ft: Double { return self / 3.28084 }
}

struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}

extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
extension Int {
    func repetitions(task: () -> ()) {
        for i in 0..self {
            task()
        }
    }
    /**
    *  通过扩展也可以修改实例本身的方法，结构体和枚举类型中修改self或其属性的方法必须将该方法标注为mutating，正如来自原始实现的修改方法一样
    */
    mutating func square() {
        self = self*self * self
    }
   // 向Int类型添加一个整型下标，下标[n]返回十进制数组从右向左数的第n个数字
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
            for _ in 1...digitIndex {
                decimalBase *= 10
            }
            return (self / decimalBase) % 10
    }
}

extension Character {
    enum Kind {
        case Vowel, Consonant, Other
    }
    var kind: Kind {
    switch String(self).lowercaseString {
    case "a", "e", "i", "o", "u":
        return .Vowel
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
    "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
        return .Consonant
    default:
        return .Other
        }
    }
}
class ExtensionsController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let oneInch = 25.4.mm
        println("One inch is \(oneInch) meters")
        // prints "One inch is 0.0254 meters"
        let threeFeet = 3.ft
        println("Three feet is \(threeFeet) meters")
        // prints "Three feet is 0.914399970739201 meters"
        
        let aMarathon = 42.km + 195.m
        println("A marathon is \(aMarathon) meters long")
        // prints "A marathon is 42195.0 meters long"
        // Do any additional setup after loading the view.
        
        let defaultRect = Rect()
        let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0),
            size: Size(width: 5.0, height: 5.0))
        let centerRect = Rect(center: Point(x: 4.0, y: 4.0),
            size: Size(width: 3.0, height: 3.0))
        // centerRect's origin is (2.5, 2.5) and its size is (3.0, 3.0)
       
        3.repetitions({
            println("Hello!")
            })
        // Hello!
        // Hello!
        // Hello!
        
        // 使用trailing闭包调用
        3.repetitions {
            println("Goodbye!")
        }  
        // Goodbye!  
        // Goodbye!  
        // Goodbye!

        
        var someInt = 3
        someInt.square()
        // someInt is now 9
        
        746381295[0]
        // returns 5
        746381295[1]
        // returns 9
        746381295[2]
        // returns 2
        746381295[8]
        // returns 7
        
        
        746381295[9]
        // returns 0, as if you had requested:  
        0746381295[9]
        
        printLetterKinds("Hello")
        // 'Hello' is made up of the following kinds of letters:
        // consonant vowel consonant consonant vowel
    }
    
    func printLetterKinds(word: String) {
        println("'\(word)' is made up of the following kinds of letters:")
        for character in word {
            switch character.kind {
            case .Vowel:
                print("vowel ")
            case .Consonant:
                print("consonant ")
            case .Other:
                print("other ")
            }
        }  
        print("\n")  
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
