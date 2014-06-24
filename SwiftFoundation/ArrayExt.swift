//
//  NSArrayExt.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-25.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
import Foundation
extension Array{

    func each (iterator: (T) -> Void ) -> Array {
        for item in self {
            iterator(item)
        }
        
        return self
    }
    
    func eachWithIndex (iterator: (T, Int) -> Void ) -> Array {
        var i = 0
        for item in self {
            iterator(item, i++)
        }
        
        return self
    }
}



