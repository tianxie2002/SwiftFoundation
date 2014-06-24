//
//  UIImageCache.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-25.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import Foundation
struct CacheHelper {
    static var filePath: String {
        get {
            var fileManager = NSFileManager.defaultManager()
            var paths = NSSearchPathForDirectoriesInDomains(.LibraryDirectory, .UserDomainMask, true)
            var cachePath = paths[0] as String + "/caches/"
            if (!fileManager.fileExistsAtPath(cachePath)) {
                fileManager.createDirectoryAtPath(cachePath, attributes: nil)
            }
            return cachePath
    }
    }
}
class UIImageCache {
    
    class func cacheObjects(object: AnyObject, key: String) {
        if (object.respondsToSelector("encodeWithCoder:")) {
            NSKeyedArchiver.archiveRootObject(object, toFile: CacheHelper.filePath + key)
        }
    }
    
    class func decacheObject(key: String) -> AnyObject! {
        var object : AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithFile(CacheHelper.filePath + key)
        if object {
            return object
        }
        return nil
    }
   
}
