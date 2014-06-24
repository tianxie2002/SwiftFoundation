//
//  BaseTabBarViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-24.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }

    init(){
       super.init(nibName:nil, bundle:nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let foundationVC = FoundationViewController()
        let  UIKitVC = UIKitViewController()
        let  netWorkVC =  NetworkViewController()
        let  databaseVC =  DatabaseViewController()
        let  otherVC = OtherViewController()
        let foundationNC = UINavigationController(rootViewController: foundationVC)
        foundationNC.tabBarItem = UITabBarItem(title: "基础", image: nil, tag: 1);
        let UIKitNC = UINavigationController(rootViewController:UIKitVC);
        UIKitNC.tabBarItem = UITabBarItem(title: "图形", image: nil, tag: 2);
        UIKitNC.title = "图形"
        let netWorkNC = UINavigationController(rootViewController:netWorkVC);
        netWorkNC.tabBarItem = UITabBarItem(title: "网络", image: nil, tag: 3);
        let databaseNC = UINavigationController(rootViewController:databaseVC);
        databaseNC.tabBarItem = UITabBarItem(title: "数据", image: nil, tag: 4);
        let otherNC = UINavigationController(rootViewController:otherVC);
        otherNC.tabBarItem = UITabBarItem(title: "其他", image: nil, tag: 5);
        var tabViewControllers = [foundationNC,UIKitNC,netWorkNC,databaseNC,otherNC];
        self.viewControllers = tabViewControllers;
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
