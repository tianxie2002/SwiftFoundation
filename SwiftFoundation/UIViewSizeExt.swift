//
//  UIViewSizeExt.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-25.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
import Foundation
/**
*  UIView 的位置拓展
*/
extension UIView{
    
    var width:      CGFloat { return self.frame.size.width }
    var height:     CGFloat { return self.frame.size.height }
    var size:       CGSize  { return self.frame.size}
    
    var origin:     CGPoint { return self.frame.origin }
    var x:          CGFloat { return self.frame.origin.x }
    var y:          CGFloat { return self.frame.origin.y }
    var centerX:    CGFloat { return self.center.x }
    var centerY:    CGFloat { return self.center.y }
    
    var left:       CGFloat { return self.frame.origin.x }
    var right:      CGFloat { return self.frame.origin.x + self.frame.size.width }
    var top:        CGFloat { return self.frame.origin.y }
    var bottom:     CGFloat { return self.frame.origin.y + self.frame.size.height }
    
    
//    func left() -> CGFloat
//    {
//       return self.frame.origin.x
//    }
//    func right()-> CGFloat
//    {
//        return self.frame.origin.x + self.frame.size.width
//    }
//    func top()->CGFloat
//    {
//        return self.frame.origin.y
//    }
//    func bottom()->CGFloat
//    {
//        return self.frame.origin.y + self.frame.size.height
//    }
//    func width()->CGFloat
//    {
//        return self.frame.size.width
//    }
//    func height()-> CGFloat
//    {
//        return self.frame.size.height
//    }
    
    func setLeft(left: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.x = left
        self.frame = rect
    }
    
    func setRight(right: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.x = right - rect.size.width
        self.frame = rect
    }
    
    func setTop(top: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.y = top
        self.frame = rect
    }
    
    func setBottom(bottom: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.origin.y = bottom - rect.size.height
        self.frame = rect
    }
    
    func setWidth(width: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.size.width = width
        self.frame = rect
    }
    
    func setHeight(height: CGFloat)
    {
        var rect:CGRect = self.frame
        rect.size.height = height
        self.frame = rect
    }
    
    


}

