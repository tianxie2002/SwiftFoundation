//
//  NestedTypesController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  枚举类型常用于实现特定的类或结构体的功能，也能在多种变量类型的环境中方便的定义通用类或结构体来使用，为实现这种功能，Swift允许自定义嵌套类型，在枚举类型、类和结构体中定义支持嵌套的类型
在一个类型中嵌套另一个类型，将需要嵌套的类型的定义写在嵌套类型的区域{}内，而且可以根据需要定义多级嵌套
*/

//  定义一个结构体BlackjackCard模拟二十一点中的点数，包含2个嵌套定义的枚举类型Suit和Rank
struct BlackjackCard {
    
    // nested Suit enumeration
    enum Suit: Character {
        case Spades = "♠", Hearts = "♡", Diamonds = "♢", Clubs = "♣"
    }
    
    // nested Rank enumeration
    enum Rank: Int {
        case Two = 2, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Jack, Queen, King, Ace
        struct Values {
            let first: Int, second: Int?
        }
        var values: Values {
        switch self {
        case .Ace:
            return Values(first: 1, second: 11)
        case .Jack, .Queen, .King:
            return Values(first: 10, second: nil)
        default:
            return Values(first: self.toRaw(), second: nil)
            }
        }
    }
    
    // BlackjackCard properties and methods
    let rank: Rank, suit: Suit
    var description: String {
    var output = "suit is \(suit.toRaw()),"
        output += " value is \(rank.values.first)"
        if let second = rank.values.second {
            output += " or \(second)"
        }
        return output
    }
}



// prints "theAceOfSpades: suit is ♠, value is 1 or 11"

class NestedTypesController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let theAceOfSpades = BlackjackCard(rank: .Ace, suit: .Spades)
        println("theAceOfSpades: \(theAceOfSpades.description)")
        
        let heartsSymbol = BlackjackCard.Suit.Hearts.toRaw() 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
