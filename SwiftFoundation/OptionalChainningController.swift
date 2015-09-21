//
//  OptionalChainningController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  可选链是一种可以请求和调用属性、方法和子脚本的过程，用于请求或调用的目标可能为nil，如果目标有值，调用就会成功，如果目标为nil，调用将返回nil，多次请求或调用可以被链接成一个链，如果任意一个节点为nil将导致整条链失效

1.可选链替代强制解析
在向调用的属性、方法或子脚本的可选值后面加一个问号，可以定义一个可选链，就像在可选值后面放一个生命符号来强制获得封包内的值，区别在于可选值为空时可选链马上失败，而强制解析将会引发运行时错误
为了反映可选链可以调用nil，无论调用的方法、属性或子脚本返回的值是不是可选值，他的返回结果都是一个可选值，利用这个返回值检验可选链调用是否成功，返回nil则失败
调用可选链的返回结果与原本的返回结果具有相同的类型，但原本的返回结果被包装成了一个可选值，当可选链调用成功时，一个应该返回Int的属性将返回Int?
*/

class Persons {
    var residence: Residences?
}

class Residences {
    var rooms = [Rooms]()
    var numberOfRooms: Int {
    return rooms.count
    }
    subscript(i: Int) -> Rooms {
        return rooms[i]
    }
    func printNumberOfRooms() {
        println("The number of rooms is \(numberOfRooms)")
    }
    var address: Addresss?
}

class Rooms {
    let name: String
    init(name: String) { self.name = name }
    
}

class Addresss {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if (buildingName != nil) {
            return buildingName
        } else if (buildingNumber != nil) {
            return buildingNumber
        } else {
            return nil
        }
    }
}

class OptionalChainningController: BaseViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 使用上述定义的类新建一个实例，尝试访问 numberOfRooms 属性，由于john.residence 为空，所以这个可选链和之前一样失败，但没有运行时错误
        let john = Persons()
        if let roomCount = john.residence?.numberOfRooms {
            println("John's residence has \(roomCount) room(s).")
        } else {
            println("Unable to retrieve the number of rooms.")
        }
        // prints "Unable to retrieve the number of rooms."

        // Do any additional setup after loading the view.
        
        // 在Residence类中定义的子脚本获取 john.residence 数组中第一个房间的名字，因为 john.residence 现在是nil，调用失败
        if let firstRoomName = john.residence?[0].name {
            println("The first room name is \(firstRoomName).")
        } else {
            println("Unable to retrieve the first room name.")
        }
        // prints "Unable to retrieve the first room name."
        
        
//        let johnsHouse = Residences()
//        johnsHouse.rooms += Rooms(name: "Living Room")
//        johnsHouse.rooms += Rooms(name: "Kitchen")
//        john.residence = johnsHouse
        /**
        *  可以使用可选链来尝试从子脚本中获取值并检查子脚本的调用是否成功，但不能通过可选链来设置子代码
        */
        if let firstRoomName = john.residence?[0].name {
            println("The first room name is \(firstRoomName).")
        } else {
            println("Unable to retrieve the first room name.")
        }
        // prints "The first room name is Living Room."
        
        
        if let johnsStreet = john.residence?.address?.street {
            println("John's street name is \(johnsStreet).")
        } else {
            println("Unable to retrieve the address.")
        }
        // prints "Unable to retrieve the address."
        
        
        let johnsAddress = Addresss()
        johnsAddress.buildingName = "The Larches"
        johnsAddress.street = "Laurel Street"
        john.residence?.address = johnsAddress
        
        if let johnsStreet = john.residence?.address?.street {
            println("John's street name is \(johnsStreet).")
        } else {
            println("Unable to retrieve the address.")
        }
        // prints "John's street name is Laurel Street."
        
        if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
            println("John's building identifier is \(buildingIdentifier).")
        }
        // prints "John's building identifier is The Larches."
        
        
        if let upper = john.residence?.address?.buildingIdentifier()?.uppercaseString {
            println("John's uppercase building identifier is \(upper).")
        }
        // prints "John's uppercase building identifier is THE LARCHES."
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
