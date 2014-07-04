//
//  ClassAndStructController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

/**
*  通过class和struct来声明结构体，大括号里定义它们的内容
*/

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}
struct Resolution {
    var width = 0
    var height = 0
}
enum CompassPoint {
    case North, South, East, West
}
class ClassAndStructController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //使用初始化方法来生成新的实例
        let someResolution = Resolution()
        let someVideoMode = VideoMode()
        println("The width of someResolution is \(someResolution.width)")
        // prints "The width of someResolution is 0"
        
        println("The width of someVideoMode is \(someVideoMode.resolution.width)")
        // prints "The width of someVideoMode is 0"
        
        someVideoMode.resolution.width = 1280
        println("The width of someVideoMode is now \(someVideoMode.resolution.width)")
        // prints "The width of someVideoMode is now 1280"
        
        let vga = Resolution(width: 640, height: 480)
        /**
        *  值类型在赋值给变量、常量或者传入到一个函数的时候，操作的都是值的拷贝，意味着它们的实例以及实例所包含的属性在代码传值的时候都会被复制
        */
        //以下定义一个hd常量，值为(1920,1080)像素的Resolution实例，然后定义cinema变量，其值为hd，cinema的值其实是hd得拷贝副本而不是hd本身，它们是两个不同的实例
        let hd = Resolution(width: 1920, height: 1080)
        var cinema = hd
        //将cinema的width属性改变，而hd实例的中不会改变，两者的修改并不会相互影响对方，因为hd赋值给cinema的时候，实际是将hd存储的值进行拷贝，然后将拷贝的值存入cinema中
        cinema.width=2048
        println("cinema is now \(cinema.width) pixels wide")
        // prints "cinema is now 2048 pixels wide"
        println("hd is still \(hd.width) pixels wide")
        // prints "hd is still 1920 pixels wide"
        
        // 枚举形式的
        var currentDirection = CompassPoint.West
        let rememberedDirection = currentDirection
        currentDirection = .East
        if rememberedDirection == .West {
            println("The remembered direction is still .West")
        }
        
        /**
        *  与值类型不同，引用类型赋予到一个变量或常量之后，操作的不是拷贝，而是实例本身
        以下tenEighty和alsoTenEighty虽然是常量，但依然可以修改它们的属性，因为这两个常量本身不会被改变，仅仅存了ViewMode()实例的引用
        */
        let tenEighty = VideoMode()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080i"
        tenEighty.frameRate = 25.0
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        println("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        // prints "The frameRate property of tenEighty is now 30.0"
        
        /**
        *  因为类是引用类型，可能出现多个变量在引用同一个类实例的情况，所以Swift提供了两个恒等运算符，判断两个常量或者变量是否引用同一个类实例
        等价于( === ) 表示两个类类型的常量或变量引用同一个实例
        不等价( !== )
        */
        if tenEighty === alsoTenEighty {
            println("tenEighty and alsoTenEighty refer to the same Resolution instance.")
        }
       
        //以下字典key/value 分别是String/Int，都是值类型，字典被拷贝时，两者都被拷贝
        var ages = ["Peter": 23, "Wei": 35, "Anish": 65, "Katya": 19]
        var copiedAges = ages
        copiedAges["Peter"] = 24
        println(ages["Peter"])
        // prints "23"
        
        /**
        *  数组的赋值和拷贝要比字典复杂，当操作数组时能提供接近C语言的功能，并且拷贝行为只在必要时才发生，将数组赋值给其他变量时，数组的内容不会被拷贝，而是被共享出来公用一个，当数组元素被修改，在另一组数组也显示同样的结果，而拷贝行为只在修改了数组长度的时候发生，发生拷贝的情况与字典类似
        */
        //将整数(Int)数组赋值给a，b，c变量
        var a = [1, 2, 3]
        var b = a
        var c = a
        
        println(a[0])
        // 1
        println(b[0])
        // 1
        println(c[0])
        // 1
        
        a[0] = 42
        println(a[0])
        // 42
        println(b[0])
        // 42
        println(c[0])
        // 42
        
        //当长度发生变化，Swift会创建这个数组的拷贝，a将会是原数组的一个独立拷贝
        a.append(4)
        a[0] = 777
        println(a[0])
        // 777
        println(b[0])
        // 42
        println(c[0])
        // 42
        
        
        /**
        *  操作数组的时候有必要确认这个数组是有一个唯一拷贝的，调用unshare方法确定数组引用的唯一性，如果一个数组被多个变量引用，在其中的一个变量调用unshare方法则会拷贝此数组，此时这个变量会有属于他自己的独立数组拷贝。
        */
        b.unshare()
        b[0] = -105
        println(a[0])
        // 777
        println(b[0])
        // -105
        println(c[0])
        // 42
        
        if b === c {
            println("b and c still share the same array elements.")
        } else {
            println("b and c now refer to two independent sets of array elements.")
        }
        // prints "b and c now refer to two independent sets of array elements."
        
        if b[0...1] === b[0...1] {
            println("These two subarrays share the same elements.")
        } else {
            println("These two subarrays do not share the same elements.")
        }
        // prints "These two subarrays share the same elements."
        
        /**
        *  通过调用copy方法进行强制复制，这方法对数组进行浅拷贝，并返回一个包含此拷贝的新数组, 我觉得是深拷贝，翻译写得是 shallow copy
        */
        var names = ["Mohsen", "Hilary", "Justyn", "Amy", "Rich", "Graham", "Vic"]
        var copiedNames = names.copy()
        copiedNames[0] = "Mo"
        println(names[0])
        // prints "Mohsen"
        /**
        *  浅拷贝就比如像引用类型，而深拷贝就比如值类型。
        
        浅拷贝是指源对象与拷贝对象共用一份实体，仅仅是引用的变量不同（名称不同）。对其中任何一个对象的改动都会影响另外一个对象。举个例子，一个人一开始叫张三，后来改名叫李四了，可是还是同一个人，不管是张三缺胳膊少腿还是李四缺胳膊少腿，都是这个人倒霉。
        
        深拷贝是指源对象与拷贝对象互相独立，其中任何一个对象的改动都不会对另外一个对象造成影响。举个例子，一个人名叫张三，后来用他克隆（假设法律允许）了另外一个人，叫李四，不管是张三缺胳膊少腿还是李四缺胳膊少腿都不会影响另外一个人。比较典型的就是Value（值）对象，如预定义类型Int32，Double，以及结构（struct），枚举（Enum）等
        *
        *  @return <#return value description#>
        */
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
