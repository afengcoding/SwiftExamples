//
//  LGFArrayViewController.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/21.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

class LGFArrayViewController: UIViewController, XXXXXX {

  static  func URLDefProtocol() -> String {
        return "array "
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = self.classForCoder.URLDefProtocol()
        let catCharacters:[Character] = ["C", "a", "t", "!"]
        let _ = String(catCharacters)
        
        let greeting  = "Guten Tag!"
        print(greeting[greeting.startIndex])
        print(greeting[greeting.index(before: greeting.endIndex)])
        print(greeting[greeting.index(after: greeting.startIndex)])
        print(greeting.index(greeting.startIndex, offsetBy: 7))
        for index in greeting.characters.indices {
            print("\(greeting[index])", terminator: "-")
        }
        
        //插入删除
        var welcome = "hello"
        welcome.insert("!", at: welcome.endIndex)
        print(welcome)
        
        welcome.insert(contentsOf: "there".characters, at: welcome.endIndex)
        print(welcome)
        
        welcome.remove(at: welcome.index(before: welcome.endIndex))
        print(welcome)
        let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
        welcome.removeSubrange(range)
        print(welcome)
        
        //数组
        var somelnts = [Int]()
        print("somelnts is of type[Int] with \(somelnts.count) items")
        somelnts.append(3)
        
        let  threeDoubles = Array(repeating: 0, count: 3)
        print(threeDoubles)
        
        print(somelnts + threeDoubles)
        
        if #available(iOS 7, *) {
            
        } else {
            
        }
        
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
