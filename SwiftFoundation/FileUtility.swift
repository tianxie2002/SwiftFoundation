//
//  FileUtility.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
//文件管理工具
class FileUtility: NSObject {
   
    class func cachePath(fileName:String)->String
    {
        var arr =  NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
        var path = arr[0] as String
        return "\(path)/\(fileName)"
    }
    
    
    class func imageCacheToPath(path:String,image:NSData)->Bool
    {
        return image.writeToFile(path, atomically: true)
    }
    
    class func imageDataFromPath(path:String)->AnyObject
    {
        var exist = NSFileManager.defaultManager().fileExistsAtPath(path)
        if exist
        {
            return  UIImage(contentsOfFile: path)!
        }
        
        return NSNull()
    }
   
    class func  getDocumentPath()->String{
        var path:Array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory,NSSearchPathDomainMask.UserDomainMask,true)
        return path[0] as String
    }
    
    class func  getCachesPath()->String{
        var path:Array = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.CachesDirectory,NSSearchPathDomainMask.UserDomainMask,true)
        return path[0] as String
    }
    
    class func getImageForBundle(fileName: String!)->UIImage{
        return UIImage(named:fileName)!
    }
    
    class func getImageFormDecoument(fileName: String!)->UIImage{
        return UIImage(contentsOfFile: getDocumentPath()+"/"+fileName)!
    }
    
//    class func saveBundleImageToDoc(imageName: String!,saveImageName: String!)->Bool{
//        var uniquePath:String = getDocumentPath()+"/"+saveImageName
//        
//        var blHave:Bool = NSFileManager.defaultManager().fileExistsAtPath(uniquePath)
//        if blHave {
//            var blDele:Bool = NSFileManager.defaultManager().removeItemAtPath(uniquePath, error: nil)
//            if blDele {
//                println("delet success")
//            }else{
//                println("delet erro")
//                return false
//            }
//        }
//        var arry =  imageName.componentsSeparatedByString(".")
//        var path:String =  NSBundle.mainBundle().pathForResource(arry[0] as String, ofType: arry[1] as String)!
//        var data:NSData = NSData.dataWithContentsOfFile(path,options: NSDataReadingOptions.DataReadingMapped,error:nil )
//        var result:Bool = data.writeToFile(uniquePath, atomically: true)
//        return result
//    }
    
    class func deletFileFromDoc(fileName: String!)->Bool{
        var blHave:Bool = NSFileManager.defaultManager().fileExistsAtPath(getDocumentPath()+"/"+fileName)
        if blHave {
            return NSFileManager.defaultManager().removeItemAtPath(getDocumentPath()+"/"+fileName, error: nil)
        }else{
            return false
        }
    }
    
    class func saveDataPlistToDoc(plistName:String!,listData:NSMutableDictionary!)->Bool{
        var result:Bool =  listData.writeToFile(getDocumentPath()+"/"+plistName, atomically: true)
        return result;
    }
    
    
    
}
