//
//  SingletonTwo.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import Foundation
// 结构体内嵌
class SingletonTwo: NSObject {
    
   //注明:Swift支持只有struct支持静态常量，class不支持静态常量
    class var shareInstance:SingletonTwo{
    //static let instance:SingletonTwo = SingletonTwo()  类中这种写法是错误的
     struct StaticInstance {
        static let instance:SingletonTwo = SingletonTwo()
        }
        return StaticInstance.instance
    }
    init(){
      println("222222")
    }
}
