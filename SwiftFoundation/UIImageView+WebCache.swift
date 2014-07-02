//
//  UIImageView+WebCache.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func setImage(urlString:String,placeHolder:UIImage!) {
        let url = NSURL.URLWithString(urlString)
        let imageName = url.lastPathComponent
        let fileCache = FileCache()
        let image : AnyObject = fileCache.getImage(imageName)
        if image as NSObject != NSNull() {
            self.image = (image as UIImage)//.makeThumbnail(CGSizeMake(88,88))
        }
        else
        {
            let req = NSURLRequest(URL: url)
            let queue = NSOperationQueue();
            NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler: {
                response, data, error in
                if error {
                    dispatch_async(dispatch_get_main_queue(), {
                        self.image = placeHolder
                        })
                }
                else
                {
                    dispatch_async(dispatch_get_main_queue(), {
                        var image = UIImage(data: data)
                        if image == nil {
                            self.image = placeHolder
                        }
                        else
                        {
                            self.image = image//.makeThumbnail(CGSizeMake(88,88))
                            fileCache.saveImage(imageName,image:data)
                        }
                        })
                }
                })
            
        }
    }
}


class FileCache: NSObject {
    
    let arr =  NSSearchPathForDirectoriesInDomains(.CachesDirectory, .UserDomainMask, true)
    
    func getCachePath(fileName:String)->String {
        return "\(arr[0])/\(fileName)"
    }
    
    func saveImage(name:String,image:NSData)->Bool {
        let path = getCachePath(name)
        //println("save: "+path)
        return image.writeToFile(path, atomically: true)
    }
    
    func getImage(name:String)->AnyObject {
        let path = getCachePath(name)
        let exist = NSFileManager.defaultManager().fileExistsAtPath(path)
        //println("get:"+path)
        if exist {
            return  UIImage(contentsOfFile: path)
        }
        return NSNull()
    }
}
