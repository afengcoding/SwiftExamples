//
//  ClassAndStructExample.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/30.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

struct Resolution {
    var width = 0
    var height = 0
}

class VideoModel {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}


class ClassAndStructExample: UIViewController , XXXXXX{

    static func URLDefProtocol() -> String {
        return "类和结构体"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = classForCoder.URLDefProtocol()
        view.backgroundColor = .white
        /**
         结构体总是通过被复制的方式在代码中传递, 不使用引用计数
         */
        let hd = Resolution(width: 1920, height: 1080)
        let tenEighty  = VideoModel()
        tenEighty.resolution = hd
        tenEighty.interlaced = true
        tenEighty.name = "1080pi"
        tenEighty.frameRate = 25.0
        
        let alsoTenEighty = tenEighty
        alsoTenEighty.frameRate = 30.0
        
        print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
        
       /**恒等运算
         因为类是引用类型, 有可能是多个敞亮和变量在幕后同时引用同一个类实例, 
         对结构体和枚举来说. 这并不成立, 因为值类型, 
         在被赋值到常量和变量或者传递到函数的时候, 其值总会被拷贝
         
         等价于 (===) 不等价与(!==)
         运用这两个运算符检测两个常量和变量是否引用同一个实例
         
        */
        
        
        
        
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
