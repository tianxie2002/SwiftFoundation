//
//  String+Ext.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-7.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import Foundation

extension String
{
    /**
    * 获取字符串的长度
    */
    var length:Int
    {
    return countElements(self)
    }
    
    
    func containsString(s:String) -> Bool
    {
        if(self.rangeOfString(s))
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    func containsString(s:String, compareOption: NSStringCompareOptions) -> Bool
    {
        if(self.rangeOfString(s, options: compareOption))
        {
            return true
        }
        else
        {
            return false
        }
    }
    /**
    *  字符串翻转
    *
    *  @return <#return value description#>
    */
    func reverse() -> String
    {
        var reverseString : String = ""
        for c in self
        {
            reverseString = c + reverseString
        }
        return reverseString
    }
        
    
}