//
//  webRequestViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
import Foundation
class webRequestViewController: BaseViewController,DataServiceDelegate {

    override func viewDidLoad() {
        // 自定义代码
        super.viewDidLoad()
        var dataService = webService(url: "http://m.weather.com.cn/data/101010100.html")
        // 1.代理获取数据方式
        // dataService.delegate = self
        
        // 2.闭包获取数据方式 第一种
        dataService.dataClosure = dataReceviedFinishedClosure
        dataService.connectionErrorClosure = connectionErrorClosure
        dataService.headerResponse = receviedResponseClosure
        /*
        // 3.闭包获取方式第二种，通过初始化的时候指定闭包
        var dataServiceClosure = DataService(url: "http://m.weather.com.cn/data/101010100.html", _dataClosure: {
        (dataService: DataService, data: NSData) -> Void in
        // 数据接收完毕
        println("data is done:\(data)")
        var decoder : JSONDecoder = JSONDecoder.decoder() as JSONDecoder
        var json : NSDictionary = decoder.objectWithData(data) as NSDictionary
        println("天气预报 数据是:\(json)")
        }, _connectionErrorClosure: {
        (dataService: DataService, error: NSError) -> Void in
        // 接受数据发生错误
        println("error:\(error)")
        })
        dataServiceClosure.start()
        */
        
        dataService.start()
    }
    
    // 定义数据加载完毕请求闭包
    func dataReceviedFinishedClosure(dataService: webService, data: NSData) -> Void {
        println("data is done:\(data)")
         let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        var decoder : JSONDecoder = JSONDecoder.decoder() as JSONDecoder
//        var json : NSDictionary = decoder.objectWithData(data) as NSDictionary
          println("天气预报 数据是:\(jsonData)")
    }
    
    // 定义数据请求失败的闭包
    func connectionErrorClosure(dataService: webService, error: NSError) -> Void {
        println("error:\(error)")
    }
    
    // 定义接收到请求头的闭包
    func receviedResponseClosure(dataService: webService, respond: NSURLResponse) -> Void {
        println("respond:\(respond)")
    }
    // 请求发送失败
    func connectionDidFailed(dataService: webService!, error: NSError!) {
        println("error:\(error)")
    }
    // 接受到响应头
    func dataServiceFinished(dataService: webService!, respond: NSURLResponse!) {
        println("respond:\(respond)")
    }
    // 正在接受数据,可以显示数据加载的百分比
    func dataServiceRecevieData(data: NSData!, dataService: webService!) {
        println("data:\(data)")
    }
    // 数据全部接受完毕调用  - (id)parseJSONData:(NSData *)jsonData
    func dataServiceRecevieDataFinished(data: NSData!, dataService: webService!) {
        println("data is done:\(data)")
        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//        var decoder : JSONDecoder = JSONDecoder.decoder() as JSONDecoder
//        var json : NSDictionary = decoder.objectWithData(data!) as NSDictionary
        println("天气预报 数据是:\(jsonData)")
    }
}