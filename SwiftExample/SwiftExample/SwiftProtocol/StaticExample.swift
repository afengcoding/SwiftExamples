//
//  StaticExample.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/30.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit


struct SomeStructure {
    static var storedTypePoperty = "some value"
    static var computedTypePoperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "some value"
    static var computedTypePoperty: Int {
        return 6
    }
}

class SomeClass {
    static var storedTypePoperty = "some value"
    static var computedTypePoperty: Int {
        return 27
    }
    
    class var overrideableComputedTypeProperty:Int {
        return 107
    }
}

class StaticExample: UIViewController, XXXXXX {

    static func URLDefProtocol() -> String {
        return "类型属性"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = classForCoder.URLDefProtocol()
        view.backgroundColor = .white
        /**
         static 定义类型属性, 在为类定义计算型类型定义的时候, 可以改用关键字class 来支持子类对父类的实现进行传给你写
         */
        
        print(SomeStructure.storedTypePoperty)
        SomeStructure.storedTypePoperty = "another value"
        print(SomeStructure.storedTypePoperty)
        
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
