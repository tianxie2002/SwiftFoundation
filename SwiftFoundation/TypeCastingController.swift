//
//  TypeCastingController.swift
//  SwiftFoundation
//
//  Created by baxiang on 14-7-4.
//  Copyright (c) 2014年 baxiang. All rights reserved.
//

import UIKit
/**
*  类型检查
类型检查是一种检查类实例的方式，或让实例称为他的父类或子类的一种方式，使用is和as操作符实现
*/

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One And Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]
class TypeCastingController: BaseViewController {

    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
        
        /**
        *  类型检查操作符 is 检查一个实例是否属于某个特定子类型，返回true/false
        */
        var movieCount = 0
        var songCount = 0
        
        for item in library {
            if item is Movie {
                ++movieCount
            } else if item is Song {
                ++songCount
            }
        }
        /**
        *  3.向下转型
        某类型的一个常量或变量可能代码里可能是属于一个子类，可以用 as 尝试向下转到他的子类型，因为向下转型可能会失败，所有有可选形式 as? 返回一个试图向下转型的可选值，当不确定能否转型成功时，采用 as? ，如果转型失败，返回nil，当确认转型一定成功时采用强制形式
        */
        for item in library {
            if let movie = item as? Movie {
                println("Movie: '\(movie.name)', dir. \(movie.director)")
            } else if let song = item as? Song {
                println("Song: '\(song.name)', by \(song.artist)")
            }
        }
        
        // Movie: 'Casablanca', dir. Michael Curtiz
        // Song: 'Blue Suede Shoes', by Elvis Presley
        // Movie: 'Citizen Kane', dir. Orson Welles
        // Song: 'The One And Only', by Chesney Hawkes
        // Song: 'Never Gonna Give You Up', by Rick Astley
        
        println("Media library contains \(movieCount) movies and \(songCount) songs")
        // prints "Media library contains 2 movies and 3 songs"
        
        /**
        *  Swift为不确定的类型提供两种类型别名：AnyObject表示任何class类型的实例，Any表示任何类型，除了方法类型
        */
        
        // 定义一个AnyObject[] 类型的数组并填入三个Movie类型的实例
        let someObjects: AnyObject[] = [
            Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
            Movie(name: "Moon", director: "Duncan Jones"),
            Movie(name: "Alien", director: "Ridley Scott")
        ]
        
        // 因为知道这个数组包含Movie实例，可以直接用 as 向下转型到Movie类型
        for object in someObjects {
            let movie = object as Movie
            println("Movie: '\(movie.name)', dir. \(movie.director)")
        }
        // Movie: '2001: A Space Odyssey', dir. Stanley Kubrick
        // Movie: 'Moon', dir. Duncan Jones
        // Movie: 'Alien', dir. Ridley Scott
        
        // 简化写法
        for movie in someObjects as Movie[] {
            println("Movie: '\(movie.name)', dir. \(movie.director)")
        }
        // Movie: '2001: A Space Odyssey', dir. Stanley Kubrick
        // Movie: 'Moon', dir. Duncan Jones
        // Movie: 'Alien', dir. Ridley Scott
        
        // 使用Any类型来混合不同类型一起工作，包括class类型
        var things = Any[]()
        
        things.append(0)
        things.append(0.0)
        things.append(42)
        things.append(3.14159)
        things.append("hello")
        things.append((3.0, 5.0))
        things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
        
        
        for thing in things {
            switch thing {
            case 0 as Int:
                println("zero as an Int")
            case 0 as Double:
                println("zero as a Double")
            case let someInt as Int:
                println("an integer value of \(someInt)")
            case let someDouble as Double where someDouble > 0:
                println("a positive double value of \(someDouble)")
            case is Double:
                println("some other double value that I don't want to print")
            case let someString as String:
                println("a string value of \"\(someString)\"")
            case let (x, y) as (Double, Double):
                println("an (x, y) point at \(x), \(y)")
            case let movie as Movie:
                println("a movie called '\(movie.name)', dir. \(movie.director)")
            default:
                println("something else")
            }
        }
        
        // zero as an Int
        // zero as a Double
        // an integer value of 42
        // a positive double value of 3.14159
        // a string value of "hello"
        // an (x, y) point at 3.0, 5.0
        // a movie called 'Ghostbusters', dir. Ivan Reitman
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
