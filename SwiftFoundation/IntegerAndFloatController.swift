//
//  IntAndFloatController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  整型与浮点型
*/
class IntegerAndFloatController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 整型转换
        // 不同类型的整型常量或者变量能够存储的数值范围是不同的。
        // Int8整型常量或者变量能够存储的数值是-128到127，而UInt8整型常量或者变量能够存储的
        // 数值范围是0到255.当编译的时候，数值越界是不会自动得到合适的值的，而且会编译出错。
        
        // let cannotBeNegative: UInt8 = -1
        // UInt8类型是不能存储负数的，所以会报告错误
        
        // Int8类型能够存储的最大值是Int8.max，再加1就会溢出
        // 溢出分为上溢和下溢，这里会是上溢，Int8.max是255，对应二进制值是0111 1111
        // 这里会报告错误
        //let tooBig: Int8 = Int8.max + 1

        // swift中数值是可以用_来分隔
        // twoThousand是UInt16类型
        let twoThousand: UInt16 = 2_000
        // one是UInt8类型
        let one: UInt8 = 1
        // twoThousand是UInt16类型，one是UInt8类型，如果要执行相加，那么就需要进行类型转换
        // 因为Swift不会像C、OC那样自动隐式转换类型，所以我们需要手动进行类型转换
        // 否则会报错的。
        let twoThousandAndOne = twoThousand + UInt16(one)
        
        /*
        整型与浮点型转换
        整型与浮点型转换必须要显示转换
        */
        // three是自动判断出是Int类型
        let three = 3
        // pointOneFourOneFiveNine是自动判断出是Double类型
        let pointOneFourOneFiveNine = 0.14159
        // 而这里执行相加，但两种变量是不同的类型，因此需要显示进行转换，
        // 所以这里把整型转换成了Double类型后，再相加
        let pi = Double(three) + pointOneFourOneFiveNine
        
        // 同理，浮点型转换成整型也需要手动转换，这里把Double或者是Float类型转换成Int类型
        // 浮点值转换成整型时，会截尾，也就是说如果pi是4.75，那么转换成整型后，值就变成了4
        // 如果pi是-3.9，那么转换成整型后，值就变成了-3
        let integerPi = Int(pi)
        // Do any additional setup after loading the view.
        
        
        /*类型别名也就是给已经存在的类型起一个别名。定义类型别名是使用关键字typealias。
        类型别名一般是为了让开发者更容易看出变量或者常量的类型或者是更好地归类某一个模块中需要使用到的类型，让开发者见名知意。
       */
        
        // 下面是给UInt16起一个别名，叫AudioSample
        // 然后就可以在其它地方使用这个AudioSample声明变量或者常量
        typealias AudioSample = UInt16
        
        // 由于前面已经定义了类型别名，那么这里使用AudioSample也相当于使用UInt16
        //所以AudioSample.min = UInt16.min,也就是0.
        var maxAmplitudeFound = AudioSample.min
        
    }

}
