//
//  SingletonOne.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import Foundation

let _SingletonShareInstance = SingletonOne()
// 全局常量
class SingletonOne: NSObject {

    class var shareInstance:SingletonOne{
        return _SingletonShareInstance
    }
    init()
    {
       println("1111111")
    }
}
