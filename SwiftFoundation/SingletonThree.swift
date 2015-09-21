//
//  SingleThree.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import Foundation

/// gdc

//+ (SingletonObject *)shareInstance {
//    
//    static SingletonObject *__singletion;
//    
//    static dispatch_once_t onceToken;
//    
//    dispatch_once(&onceToken, ^{
//    
//    __singletion=[[self alloc] init];
//    
//    });
//    
//    return __singletion;
//    
//}
class SingletonThree: NSObject {
   
    class var sharedInstance :SingletonThree{
        dispatch_once(&StaticInstance.onceToke){
            StaticInstance.singletion = SingletonThree()
        }
        return StaticInstance.singletion!
    }
    struct StaticInstance{
        static var onceToke:dispatch_once_t = 0
        static var singletion: SingletonThree?
    }
    override init() {
        println("333333");
    }
}
