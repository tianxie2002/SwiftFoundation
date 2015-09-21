//
//  DeinitializationController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  Swift会自动释放不需要的实例以释放资源，但当使用自己的资源的时候，需要清理额外的信息，如创建一个自定义的类来打开文件并写入数据，可能需要在类实例被释放之前关闭该文件
每个类组多只有一个析构函数，不允许主动调用，在实例被释放的前一步被自动调用，因为析构函数知道实例被释放才会被调用，所以可以访问实例的所有属性，并进行操作
*/
struct Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinsToVend: Int) -> Int {
        numberOfCoinsToVend = min(numberOfCoinsToVend, coinsInBank)
        coinsInBank -= numberOfCoinsToVend
        return numberOfCoinsToVend
    }
    static func receiveCoins(coins: Int) {
        coinsInBank += coins
    }
}
class Players {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receiveCoins(coinsInPurse)
    }
}

class DeinitializationController: BaseViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        
        var playerOne: Players! = Players(coins: 100)
        println("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
        // prints "A new player has joined the game with 100 coins"
        println("There are now \(Bank.coinsInBank) coins left in the bank")
        // prints "There are now 9900 coins left in the bank"
        
        
        playerOne.winCoins(2_000)
        println("PlayerOne won 2000 coins & now has \(playerOne!.coinsInPurse) coins")
        // prints "PlayerOne won 2000 coins & now has 2100 coins"
        println("The bank now only has \(Bank.coinsInBank) coins left")
        // prints "The bank now only has 7900 coins left"
        
        
        playerOne = nil
        println("PlayerOne has left the game")
        // prints "PlayerOne has left the game"
        println("The bank now has \(Bank.coinsInBank) coins")
        // prints "The bank now has 10000 coins"
        // Do any additional setup after loading the view.
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
