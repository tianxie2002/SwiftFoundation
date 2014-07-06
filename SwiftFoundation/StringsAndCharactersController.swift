//
//  StringsAndCharactersController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
import Foundation
/*
字符串是有序的字符集，如"hello, world" 或者 "albaatross".在Swift中字符串类型是String,由有序的Character组合而成。
Swift中的String与Character类型提供了快速，与Unicode兼容的方式在代码中操作文本。String字符串的创建与操作的语法
是轻量的，可阅读的，与C语言中的字符串语法类似。字符串的连接可以使用+操作符直接相连，字符串可变性是通过选择
常量或者变量，就像Swift中的其它任何类型一样。
*/
class StringsAndCharactersController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
       // 字符串中可以包含特殊字符，
        let wiseWords = "\"Imagintion is more important than knowledge\" - Einstein"
        let dollarSign = "\x24"
        let balckHeart = "\u2665"
        let sparkingHeart = "\U0001F496"
        
        //初始化空字符串
        // 下面这两个都是是空串，这两个是相等的
        var emptyString = ""
        var anotherEmptyString = String()
        // 判断空字符
        if emptyString.isEmpty {
            println("Nothing to see here")
        }
        //把字符串赋值给一个变量，就可以修改，赋值给一个常量，就不能修改。
        var variableString = "Horse"
        variableString += " and carriage" // variableString is now "Horse and carriage"
        
        let constantString = "Highlander"
        //constantString += "and another Highlander" // compile error
        
        //Strings是值类型而不是引用类型。
       // 当创建一个新的字符串时，String值是copy的。
        //也就是说在传参数给函数或者方法，或者赋值给某个常量或者变量时，是copy一份。
        
        //字符串中的字符：Character类型
        for character in "Dog!" {
            println(character)
        }
        //Swift提供了一个全局的计算元素个数的函数：countElements
        let msg = "I am a boy, and I love Swift."
       // let count  = countElements(msg)
        println("msg has \(countElements(msg)) 字符")
        
        let str1 = "hello"
        let str2 = " mimi"
        let character1: Character = "!"
        let character2: Character = "?"
        
        let stringPlusCharacter = str1 + character1 // equals "hello!"
        let stringPlusString = str1 + str2// equals "hello mimi"
        let characterPlusString = character1 + str1 // equals "!hello"
        let characterPlusCharacter = character1 + character2 // equals "!?"
        
        //使用 += 给已经存在的字符串追加字符串
        var instroduction = "look over"
        let str = ",I am here"
        instroduction += str // 结果是instroduction变成了"look over,I am here"
        
        //字符串插入（String Interpolation）
        let multiplier = 3
        // 通过\(变量或者常量名)可以插入字符串
        // 结果是:3 times 2.5 is 7.5
        let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
        
        //字符串比较：字符串相等、字符串前缀相关、字符串后缀相等
        //字符串相等是在两个字符串包含完全相同的字符且相同的顺序才是相等的。
        var quotaton = "We're a lot alike, you and I."
        var sameQuotation = "We're a lot alike,you and I."
        if quotaton == sameQuotation {
            println("They are equal strings")
        }
        
        //前缀相等比较：
        let strPrefix = "I am your lover"
        let anotherStrPrefix = "I am your lover two"
        
        if anotherStrPrefix.hasPrefix(strPrefix) {
            println("\(anotherStrPrefix) has prefix \(strPrefix)")
        }
        //后缀相等比较
        let strSuffix = "I am your lover"
        let anotherStrSuffix = "really? I am your lover"
        if anotherStrSuffix.hasSuffix(strSuffix) {
            println("\(anotherStrSuffix) has suffix \(strSuffix)")
        }
        
        //字符串大小写转换（uppercase and lowercase strings）
        let normal = "Could you help me, please?"
        let shouty = normal.uppercaseString
        println(shouty)
        let whispered = normal.lowercaseString
        println(whispered)

    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
