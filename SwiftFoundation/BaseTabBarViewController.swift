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
        let  dataVC =  DataStoreViewController()
        let  otherVC = OtherViewController()
        let foundationNC = UINavigationController(rootViewController: foundationVC)
        foundationNC.hidesBottomBarWhenPushed = true;
        foundationNC.tabBarItem = UITabBarItem(title: "基础", image: UIImage(named:"tab_icon_base"), tag: 1);
        let UIKitNC = UINavigationController(rootViewController:UIKitVC);
        UIKitNC.tabBarItem = UITabBarItem(title: "图形", image: UIImage(named:"tab_icon_uikit"), tag: 2);
        let dataNC = UINavigationController(rootViewController:dataVC);
        dataNC.tabBarItem = UITabBarItem(title: "数据", image: UIImage(named:"tab_icon_data"), tag: 3);
         //dataNC.hidesBottomBarWhenPushed = true;
        let otherNC = UINavigationController(rootViewController:otherVC);
        otherNC.tabBarItem = UITabBarItem(title: "其他", image: UIImage(named:"tab_icon_other"), tag: 4);
        var tabViewControllers = [foundationNC,UIKitNC,dataNC,otherNC];
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
