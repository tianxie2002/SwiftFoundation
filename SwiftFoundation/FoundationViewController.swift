//
//  FoundationViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-24.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class FoundationViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    var  foundationTableView : UITableView?
    var  foundationArray : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "基础"
        self.foundationArray = ["Closures闭包",
                            "Protocol传值",
                            "单例模式",
                             "网络请求",
                            "常量和变量 ",
                            "整型和浮点",
                            "元组",
                            "可选值",
                            "基础运算",
                             "字符串和字符",
                             "数组和字典",
                             "控制流",
                             "函数",
                             "闭包",
                             "可选类型",
                             "类和结构体",
                             "属性",
                             "方法",
                             "继承",
                             "扩展",
                             "构造函数",
                             "析构函数",
                             "ARC机制",
                             "可选链",
                             "泛型",
                             "类型检查",
                             "类型嵌套"
                          ]
        self.foundationTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.foundationTableView!.delegate = self
        self.foundationTableView!.dataSource = self
        // self.uikitTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // self.uikitTableView!.
        self.view.addSubview(self.foundationTableView)
    }
    // UITableViewDataSource Methods
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int
    {
        return 1
    }
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat{
        
        
        return 50;
    }
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.foundationArray!.count
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        //let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell!
        //let cell =  UITableViewCell.init(style: UITableViewCellStyle.Value2, reuseIdentifier: "Cell")
        var cell = tableView.dequeueReusableCellWithIdentifier("CELL") as? UITableViewCell
        
        if !cell {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "CELL")
        }
        cell!.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell!.textLabel.text = self.foundationArray?.objectAtIndex(indexPath.row) as String
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {
        self.foundationTableView!.deselectRowAtIndexPath(indexPath, animated: true)
        switch indexPath.row
        {
        case 0:
         var detailViewController = ClosureShowValueViewController()
         detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
         self.navigationController.pushViewController(detailViewController, animated:false)
        case 1:
            var detailViewController = ProtocolShowValueViewController()
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 2:
            var detailViewController = SingletonPatternViewController()
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 3:
            var detailViewController = webRequestViewController()
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 4:
            var detailViewController = ConstantAndVariablesController()
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 5:
            var detailViewController = IntegerAndFloatController()
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 6:
            var detailViewController = TuplesViewController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 7:
            var detailViewController = OptionalsValueController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 8:
            var detailViewController = BasicOperatorsController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 9:
            var detailViewController = StringsAndCharactersController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 10:
            var detailViewController = ArrayAndDictionaryController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 11:
            var detailViewController = FlowControlController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 12:
            var detailViewController = FunctionsViewController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 13:
            var detailViewController = ClosuresViewController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 14:
            var detailViewController = OptionalTypeViewController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 15:
            var detailViewController = ClassAndStructController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 16:
            var detailViewController = PropertiesController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 17:
            var detailViewController = InstanceMethodsController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 18:
            var detailViewController = InheritanceController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 19:
            var detailViewController = ExtensionsController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 20:
            var detailViewController = InitializationController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 21:
            var detailViewController = DeinitializationController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 22:
            var detailViewController = AutomaticReferenceCountController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 23:
            var detailViewController = OptionalChainningController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 24:
            var detailViewController = GenericController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 25:
            var detailViewController = TypeCastingController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        case 26:
            var detailViewController = NestedTypesController(nibName:nil,bundle:nil)
            detailViewController.title = self.foundationArray?.objectAtIndex(indexPath.row)  as String
            self.navigationController.pushViewController(detailViewController, animated:false)
        default:
            println()
        }
        
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
