//
//  UIImageExt.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-25.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit



extension UIImage{
    /**
    *  截图
    *
    *  @param CGRect <#CGRect description#>
    *
    *  @return UIImage
    */
    func croppedImage(bound : CGRect) -> UIImage{
    
        var scaledBounds : CGRect = CGRectMake(bound.origin.x * self.scale, bound.origin.y * self.scale, bound.size.width * self.scale, bound.size.height * self.scale)
        var imageRef = CGImageCreateWithImageInRect(self.CGImage, scaledBounds)
        var croppedImage : UIImage = UIImage(CGImage: imageRef, scale: self.scale, orientation: UIImageOrientation.Up)!
        return croppedImage;
    }
    
}