//
//  webService.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import Foundation

// 宏定义 闭包类型
typealias dataRecevieFinished=(dataService: webService, data: NSData) -> Void
typealias connectionError=(dataService: webService, error: NSError) -> Void
typealias recevieHeaderResponse=(dataService: webService, respond: NSURLResponse) -> Void

@objc protocol DataServiceDelegate: NSObjectProtocol {
    optional func connectionDidFailed(dataService: webService!, error: NSError!) // 请求发送失败
    optional func dataServiceFinished(dataService: webService!, respond: NSURLResponse!) // 接受到响应头
    optional func dataServiceRecevieData(data: NSData!, dataService: webService!) // 正在接受数据,可以显示数据加载的百分比
    optional func dataServiceRecevieDataFinished(data: NSData!, dataService: webService!) // 数据全部接受完毕调用
}

class webService: NSObject,NSURLConnectionDelegate, NSURLConnectionDataDelegate
{
    // 代理形式
    var delegate: DataServiceDelegate?
    var timeout: NSTimeInterval?
    var urlString: String?
    var connection: NSURLConnection?
    var _data: NSMutableData?
    
    // 定义闭包全局变量
    var dataClosure: dataRecevieFinished?
    var connectionErrorClosure: connectionError?
    var headerResponse: recevieHeaderResponse?
    
    // 初始化
    override init() {
        super.init()
        _data = NSMutableData()
    }
    
    init(url: String!) {
        super.init()
        urlString = url
        _data = NSMutableData()
    }
    
    init(url: String!, _dataClosure: dataRecevieFinished, _connectionErrorClosure: connectionError) {
        super.init()
        urlString = url
        _data = NSMutableData()
        dataClosure = _dataClosure
        connectionErrorClosure = _connectionErrorClosure
    }
    
    /**
    *  开始请求数据
    *
    *  @return
    */
    func start() {
        var request:NSURLRequest?
        // 判断网址是否为空
        if !(urlString != nil) {
            println("您没有实例化 urlString属性的值")
            return
        }
        var url = NSURL(string: urlString!)
         request = NSURLRequest(URL: url!, cachePolicy: .UseProtocolCachePolicy, timeoutInterval: 20)
        
//        // 设置请求超时时间
//        if !(timeout != nil) {
//            println("没有设置请求超时时间")
//            request = NSURLRequest(URL: url!)
//        } else {
//           
//        }
        // 建立网络请求
        connection = NSURLConnection(request: request!, delegate: self, startImmediately: false)
        // 开始网络请求
        connection!.start()
    }
    
    
    /**
    *  取消网络请求
    *
    *  @return 无
    */
    func cancel() {
        if (connection != nil) {
            connection!.cancel()
            connection = nil
        }
    }
    
    /**
    *  发送请求失败代理方法
    *
    *  @param NSURLConnection! NSURL连接对象
    *  @param NSError!         错误对象
    *
    *  @return 无
    */
    func connection(connection: NSURLConnection!, didFailWithError error: NSError!) {
        _data!.resetBytesInRange(NSRange(location: 0,length: _data!.length))
        _data!.length = 0
        if (connectionErrorClosure != nil) {
            // 标识又闭包
            connectionErrorClosure?(dataService: self, error: error)
        }
        
        if (delegate != nil) {
            delegate?.connectionDidFailed!(self, error: error)
        }
    }
    
    /**
    *  接收到请求响应
    *
    *  @param NSURLConnection! NSURLConnection! 对象
    *  @param NSURLResponse!   NSURLResponse! 对象
    *
    *  @return 无
    */
    func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!){
        if (headerResponse != nil) {
            // 标识又闭包
            headerResponse?(dataService: self, respond: response)
        }
        
        if (delegate != nil) {
            delegate?.dataServiceFinished!(self, respond: response)
        }
    }
    
    /**
    *  接收到 请求的数据
    *
    *  @param NSURLConnection! NSURLConnection! description
    *  @param NSData!          NSData! description
    *
    *  @return return value description
    */
    func connection(connection: NSURLConnection!, didReceiveData data: NSData!){
        _data!.appendData(data)
        if (delegate != nil) {
            delegate?.dataServiceRecevieData!(data, dataService: self)
        }
    }
    
    /**
    *  数据接收完毕
    *
    *  @param NSURLConnection! NSURLConnection! description
    *
    *  @return return value description
    */
    func connectionDidFinishLoading(connection: NSURLConnection!) {
        if (dataClosure != nil) {
            // 表示传的是闭包过来
            dataClosure?(dataService: self, data: _data!)
        }
        
        if (delegate != nil) {
            delegate?.dataServiceRecevieDataFinished!(_data, dataService: self)
        }
    }
}