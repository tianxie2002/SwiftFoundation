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
    
    var imageViewIcon : UIImageView?
    var weathlabel :UILabel?
    override func viewDidLoad() {
        // 自定义代码
        super.viewDidLoad()
       var dataService = webService(url: "http://www.weather.com.cn/data/cityinfo/101010100.html")
//////        // 1.代理获取数据方式
//////        // dataService.delegate = self
//////        
//////        // 2.闭包获取数据方式 第一种
        dataService.dataClosure = dataReceviedFinishedClosure
        dataService.connectionErrorClosure = connectionErrorClosure
        dataService.headerResponse = receviedResponseClosure
        
        // 3.闭包获取方式第二种，通过初始化的时候指定闭包
//        var dataServiceClosure = webService(url: "http://m.weather.com.cn/data/101010100.html", _dataClosure: {
//        (dataService: webService, data: NSData) -> Void in
//        // 数据接收完毕
//        let jsonData = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
//       
//        println("天气预报 数据是:\(jsonData)")
//        }, _connectionErrorClosure: {
//        (dataService: webService, error: NSError) -> Void in
//        // 接受数据发生错误
//        println("error:\(error)")
//       })
//        dataServiceClosure.start()

        [self .loadJsonData()];
        //dataService.start()
        setupView()
    }
    
    func loadJsonData(){
        //定义获取json数据的接口地址，这里定义的是获取天气的API接口,还有一个好处，就是swift语句可以不用强制在每条语句结束的时候用";"
        var url = NSURL(string:"http://www.weather.com.cn/data/sk/101110101.html")
        //获取JSON数据
        var resultData = NSData(contentsOfURL: url!,options:NSDataReadingOptions.DataReadingUncached,error:nil)
       let jsonObject : AnyObject! = NSJSONSerialization.JSONObjectWithData(resultData!, options: NSJSONReadingOptions.MutableContainers, error: nil)
        println("\(jsonObject)");
        //解析获取JSON字段值
//        var weatherInfo:AnyObject = json.objectForKey("weatherinfo")!! //json结构字段名。
//        var city:AnyObject = weatherInfo.objectForKey("city")!
        //以此类推获取其他字段的信息,再此我就不过多赘述了。
        
        //然后把获取到的json值赋值个相应的控件即可。
        
    }
    func setupView(){
    
        var imagebg : UIImage  = UIImage(named: "天气预报.png")!
        var imageViewbg = UIImageView(frame: CGRectMake( 50, 120.0, 220, imagebg.size.height+50))
        imageViewbg.image = imagebg
        self.view.addSubview(imageViewbg)
        imageViewIcon = UIImageView(frame: CGRectMake((CGRectGetWidth(self.view.bounds) - imagebg.size.width) / 2.0-40, 80.0, 175, 100))
        self.view.addSubview(imageViewIcon!)
        var label = UILabel(frame: CGRectMake(150, 130.0, 100, 25))
        label.backgroundColor = UIColor.clearColor()
        label.textAlignment = NSTextAlignment.Center
        label.font = UIFont.boldSystemFontOfSize(30)
        label.textColor = UIColor.whiteColor()
        label.text = "北京"
        self.view.addSubview(label)
        weathlabel = UILabel(frame: CGRectMake(150, 160.0, 100, 25))
        weathlabel!.backgroundColor = UIColor.clearColor()
        weathlabel!.textAlignment = NSTextAlignment.Center
        weathlabel!.font = UIFont.boldSystemFontOfSize(17)
        weathlabel!.textColor = UIColor.whiteColor()
        self.view.addSubview(weathlabel!)
    }
    // 定义数据加载完毕请求闭包
    func dataReceviedFinishedClosure(dataService: webService, data: NSData) -> Void {
       //println("----------------\(data)")
        var error : NSError?
        var options = NSJSONReadingOptions.MutableContainers
        let jsonData:AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options:NSJSONReadingOptions.AllowFragments, error:&error)
         println("----------------\(jsonData)")
        let  jsonWeather = jsonData?["weatherinfo"] as NSDictionary
        println("天气预报 数据是:\(jsonWeather)")
        let  strWeather = jsonWeather["weather"] as String
        weathlabel!.text = strWeather
        var fileName = "晴.png"
        if  strWeather.containsString("雷阵雨")
        {
            fileName = "雷阵雨.png";
        }
        else if  strWeather.containsString("雾")
        {
            fileName = "雾.png";
        }
        else if  strWeather.containsString("大雪")
        {
            fileName = "大雪.png";
        }
        else if  strWeather.containsString("大雨")
        {
            fileName = "大雨.png";
        }
        else if  strWeather.containsString("中雪")
        {
            fileName = "中雪.png";
        }
        else if  strWeather.containsString("中雨")
        {
            fileName = "中雨.png";
        }
        else if  strWeather.containsString("小雪")
        {
            fileName = "小雪.png";
        }
        else if  strWeather.containsString("小雨")
        {
            fileName = "小雨.png";
        }
        else if  strWeather.containsString("雷雨")
        {
            fileName = "雷雨.png";
        }
        else if  strWeather.containsString("多云")
        {
            fileName = "多云.png";
        }
        else if  strWeather.containsString("阴")
        {
            fileName = "阴.png";
        }
        else if  strWeather.containsString("雨")
        {
            fileName = "雨.png";
        }
        else if  strWeather.containsString("雪")
        {
            fileName = "雪.png";
        }
        else if  strWeather.containsString("阴转晴")
        {
            fileName = "阴转晴.png";
        }
        else if  strWeather.containsString("风")
        {
            fileName = "风.png";
        }
        else if  strWeather.containsString("阴转晴")
        {
            fileName = "阴转晴.png";
        }
        else if  strWeather.containsString("大雨转晴")
        {
            fileName = "大雨转晴.png";
        }
       imageViewIcon!.image = UIImage(named: fileName)

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