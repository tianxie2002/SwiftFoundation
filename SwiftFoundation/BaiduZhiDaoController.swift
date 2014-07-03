//
//  QiuShiBaiKeViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-6-29.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  百度知道数据解析
*/
class BaiduZhiDaoController: UIViewController,UITableViewDataSource,UITableViewDelegate {

//    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        // Custom initialization
//    }
    var dataTableView: UITableView?
    var dataArray = NSMutableArray()
    var uikitArray : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadData()
    }
    
    func setupViews()
    {
        var width = self.view.frame.size.width
        var height = self.view.frame.size.height
        self.dataTableView = UITableView(frame:self.view.frame)
        self.dataTableView!.delegate = self;
        self.dataTableView!.dataSource = self;
        self.dataTableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.view.addSubview(self.dataTableView)
    }
    func loadData()
    {
        var stringURL = "http://wapiknow.baidu.com/mapi/question/v5/homepageql?rn=30"
        self.requestWithURL(stringURL,completionHandler:{requestData in
            var dataDict = requestData["data"] as NSDictionary
            var listArray =   dataDict["list"] as NSArray
            println(listArray)
            for qut : AnyObject in listArray
            {
                var dict = qut as NSDictionary
                self.dataArray.addObject(dict.objectForKey("content"))
            }
            self.dataTableView!.reloadData()
            })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    

    /**
    *  网络数据请求
    *
    *  @param urlString:String                        数据请求的url
    *  @param completionHandler:requestData:AnyObject 返回的数据结果
    *
    *  @return <#return value description#>
    */
    func requestWithURL(urlString:String,completionHandler:(requestData:AnyObject) ->Void){
        var URL = NSURL.URLWithString(urlString)
        var req = NSURLRequest(URL: URL)
        var queue = NSOperationQueue();
        NSURLConnection.sendAsynchronousRequest(req, queue: queue, completionHandler:{ response, data, error in
            if data
            {
             let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                dispatch_async(dispatch_get_main_queue(),
                    {
                        completionHandler(requestData:jsonData)
                        
                    })
                }
            
            }
        )
    }
    func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
   
    
    
    func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath?) -> UITableViewCell? {
        
        let cell = tableView?.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.numberOfLines = 0
        cell.textLabel.text = self.dataArray[indexPath!.row] as String
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat
    {
        //        var index = indexPath!.row
        //        var data = self.dataArray[index] as NSDictionary
        //        return  YRJokeCell.cellHeightByData(data)
        return 100;
    }
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!)
    {

    }
    



}
