//
//  AutomaticReferenceCountController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  当创建一个类的实例，ARC就会分配一块内存来存储实例的信息，内存中包含实例的类型信息以及这个实例所有相关属性的值。当实例不再使用，ARC释放实例所占用的内存，并让释放的内存另作他用，确保不再使用的内存不会一直占用内存
当ARC回收了正在使用的实例，该实例的方法和属性将不能再被访问和操作，如果此时尝试使用，应用将会崩溃。为了确保使用中的实例不会被错误的销毁，ARC会跟踪和计算每一个实例正在被多少属性，常量和变量引用，将实例进行赋值的时候，都会对此实例创建强引用，只要强引用还在，实例是不允许被销毁的
*/

class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { println("\(name) is being deinitialized") }
}

class Apartment {
    let number: Int
    init(number: Int) { self.number = number }
    weak var tenant: Person?
    deinit { println("Apartment #\(number) is being deinitialized") }
}

class Country {
    let name: String
    let capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
}

class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
}
/**
*  6.解决闭包引起的循环强引用
在定义闭包时同时定义占有列表作为闭包的一部分，占有列表定义了闭包体内占有一个或多个引用类型的规则
6.1定义占有列表
占有列表中的每个元素都有weak或unowner关键字和实例的引用成对组成
*/
class HTMLElement {
    
    let name: String
    let text: String?
    
    @lazy var asHTML: () -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        println("\(name) is being deinitialized")
    }
    
}

class AutomaticReferenceCountController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // 变量被定义为可选类型(Person?)，他们的值会自动赋值为nil，暂时还不会引用到Person实例
        var reference1: Person?
        var reference2: Person?
        var reference3: Person?
        
        // 当调用Person类的构造函数，Person类的新实例赋值给reference1变量，之间建立了一个强引用，保证Person实例不会被ARC销毁
        reference1 = Person(name: "John Appleseed")
        // prints "John Appleseed is being initialized"
        
        // 当赋值给其他两个变量，该实例又多出两个强引用
        reference2 = reference1
        reference3 = reference1
        
        
        // 通过给变量赋nil，断开强引用，现在还有一个，Person类还不会被销毁
        reference1 = nil
        reference2 = nil
        
        // 最后一个强引用被断开，析构函数执行，Person实例被销毁
        reference3 = nil
        // prints "John Appleseed is being deinitialized"
        
       
        
        var john: Person?
        var number73: Apartment?
        
        john = Person(name: "John Appleseed")
        number73 = Apartment(number: 73)
        
        john!.apartment = number73
        number73!.tenant = john
        
        // Person实例保存着对Apartment实例的强引用，但是Apartment只是对Person实例的弱引用，当断开john变量所保持的强引用时，再没有指向Person实例的强引用了
        john = nil
        // prints "John Appleseed is being deinitialized"
        
        // 此时也没有指向Apartment实例的强引用，该实例也会被销毁
        number73 = nil  
        // prints "Apartment #73 is being deinitialized"
        
        var country = Country(name: "Canada", capitalName: "Ottawa")
        println("\(country.name)'s capital city is called \(country.capitalCity.name)")
        
        var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
        println(paragraph!.asHTML())
        // prints "<p>hello, world</p>"
        
        
        paragraph = nil
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
