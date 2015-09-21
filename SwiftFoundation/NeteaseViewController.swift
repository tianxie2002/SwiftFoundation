//
//  NeteaseViewController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-2.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit

class NeteaseViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource {
    
    var dataTableView : UITableView?
    var dataArray = NSMutableArray()
    var thumbQueue = NSOperationQueue()
    let NeteaseNewsApiUrl = "http://c.m.163.com/nc/article/headline/T1348647853363/0-20.html"
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataTableView  = UITableView(frame:self.view.frame, style:UITableViewStyle.Plain)
        self.dataTableView!.delegate = self
        self.dataTableView!.dataSource = self
        let footView = UIView()
        footView.backgroundColor = UIColor.lightGrayColor()
        self.dataTableView!.tableFooterView = footView
        var nib = UINib(nibName:"NewsViewCell", bundle: nil)
        //println(NeteaseNewsCell);
        //self.tableView?.registerNib(nib, forCellReuseIdentifier: identifier)
        //self.dataTableView!.registerNib(nil, forCellReuseIdentifier: "NewsCell")
        self.dataTableView!.registerClass(NewsViewCell.self, forCellReuseIdentifier: "NewsCell")
        self.view.addSubview(self.dataTableView!)
        loadDataSource()
        //        let refreshControl = UIRefreshControl()
        //        refreshControl.attributedTitle = NSAttributedString(string: "下拉刷新")
        //        refreshControl.addTarget(self, action: "loadDataSource", forControlEvents: UIControlEvents.ValueChanged)
        //        self.refreshControl = refreshControl
        // Do any additional setup after loading the view.
    }
    func loadDataSource() {
        //self.refreshControl.beginRefreshing()
        var url = NSURL(string:NeteaseNewsApiUrl)
        var request = NSURLRequest(URL: url!)
        var loadDataSourceQueue = NSOperationQueue();
        
        NSURLConnection.sendAsynchronousRequest(request, queue: loadDataSourceQueue, completionHandler: { response, data, error in
            if (error  != nil) {
                println(error)
                dispatch_async(dispatch_get_main_queue(), {
                    //self.refreshControl.endRefreshing()
                    })
            } else {
                let json = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: nil) as NSDictionary
                let newsDataSource = json["T1348647853363"] as NSArray
                dispatch_async(dispatch_get_main_queue(), {
                    self.dataArray.addObjectsFromArray(newsDataSource)
                    self.dataArray.removeObjectAtIndex(0)
                    self.dataTableView!.reloadData()
                    })
            }
            })
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #pragma mark - Table View
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("NewsCell", forIndexPath: indexPath) as NewsViewCell
        
        let object = dataArray[indexPath.row] as NSDictionary
        cell.newsTitle!.text = object["title"] as? String
        //cell.title.font = UIFont.systemFontOfSize(14)
       // cell.newsDescrip!.numberOfLines = 0
        cell.newsDescrip!.text = object["digest"] as? String
        cell.newsDescrip!.font = UIFont.systemFontOfSize(12)
        cell.newsImageView!.contentMode = UIViewContentMode.ScaleAspectFit
        cell.newsImageView!.setImage(object["imgsrc"] as String, placeHolder: UIImage(named :"cell_photo_default_small"))
        //        let request = NSURLRequest(URL :NSURL.URLWithString(object["imgsrc"] as String))
        //        NSURLConnection.sendAsynchronousRequest(request, queue: thumbQueue, completionHandler: { response, data, error in
        //            if error {
        //                println(error)
        //
        //            } else {
        //                let image = UIImage.init(data :data)
        //                dispatch_async(dispatch_get_main_queue(), {
        //                    cell.imageView.image = image
        //                    })
        //            }
        //            })
        
        
        return cell
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 80
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
