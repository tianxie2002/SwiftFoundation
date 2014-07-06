//
//  ConstantAndVariablesController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class ConstantAndVariablesController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 分号加不加都行，如果看不习惯，可以自行添加
        // 声明了一个名叫maximumNumberOfLoginAttempts的常量，由于没有指定类型，而又进行了初始化，其值为10，
        // 所以swift会自动推断出常量maximumNumberOfLoginAttempts的类型为Int
        // 这个写法相当于：let maximumNumberOfLoginAttempts: Int = 10
        let maximumNumberOfLoginAttempts = 10
        // 声明的currentLoginAttempt是一个变量，在其他地方可以修改这个变量的值
        // 这里没有显示指定变量的类型，但因为有了初始值0，因此Swift会推断出这个变量的类型为Int
        // 因此下面的写法相当于：var currentLoginAttempt: Int = 10
        var currentLoginAttempt = 10
        
        //可以在一行声明多个变量，变量之间用逗号隔开
        // swift在推断浮点类型时，默认会使用Double类型，下面相当于：
         var x: Double = 0.0, y: Double = 0.0, z: Double = 0.0
        // 这样写法是错误的，因为我们没有指定类型，而swift又没有具体的初始值来判断
        // 错误写法
        //var welcomeMessage
        //那么我们有两种方式处理，一种是给定一个初始值让swift帮助我们推断出类型，另一种是我们显示指定类型
        var welcomeMessage: String // 我们想要的是String类型
        welcomeMessage = "Hello" // swift会根据这个初始值判断出类型为String
        let n = 3.14159
        let 你好 = "你好，Swift" // 虽然可以用中文作为变量名，但我不建议这么做。。。个人建议
        
        // 在swift中打印语句可以用println,print
        // 前者是打印最后添加了一个换行，后者则没有添加
        println(welcomeMessage) // 会换行
        print(welcomeMessage)   // 不会换行
        
        // 注意到这里打印的方式了吗？使用\()把变量放到括号中
        println("The welcomeMessage is \(welcomeMessage)")
        
        // 这是单行注释
        
        /* 这也是注释，但是多行注释
        /*多行注释在swift中是可以嵌套的*/
        /*原官方指导教程上说嵌套多行注释可以快速、简单地把大的代码块分成多块来注释 */
        */
        let catOne = "a cat" // 可以不添加分号
        let catTwo = "a cat"; println(catTwo)// 除了最后一条语句可以不添加分号外，其它都需要添加分号来隔开
        let catThree = "a cat"; let name = "mimi"; println("\(name) is \(catThree)")
    
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
