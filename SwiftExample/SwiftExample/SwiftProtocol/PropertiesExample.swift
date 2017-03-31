//
//  PropertiesExample.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/30.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}

struct Point  {
    var x = 0.0, y = 0.0
}

struct Size  {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        
        set(newCenter) {
            origin.x = newCenter.x - size.width / 2
            origin.y = newCenter.y - size.height / 2
            
        }
    }
}

class PropertiesExample: UIViewController, XXXXXX {

    static func URLDefProtocol() -> String {
        return "属性"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = classForCoder.URLDefProtocol()
        view.backgroundColor = .white
        /** 
         存储属性
         计算属性
         属性观察器
         全局变量和局部变量
         类型属性
         
         计算属性可以用于 类/结构体/枚举
         存储属性可以用于 类/结构体
         计算属性不直接存储值, 而是提供一个getter和可选的setter 来间接获取和设置其他属性或变量的值
         
         */
        
        var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
        rangeOfThreeItems.firstValue = 6
        //length 不可变
        //rangeOfThreeItems.length = 4
        
        
        //如果创建了一个结构体实例并将其赋给一个常量let , 则无法修改该实例的任何属性
        //即使属性声明为变量也不行
        //这是因为 结构体是值类型, 当值类型的实例被声明为let的时候, 它的所有属性也就变成了let
        //引用类型的类class则不一样, 把一个引用类型的实例赋给一个常量后,任然可以修改该实例的变量属性
        let  rangeOfFourItems = FixedLengthRange(firstValue: 4, length: 6)
       // rangeOfFourItems.firstValue = 10
        
        
        /** 延迟存储属性 懒加载
         懒加载 必修声明为 var 因为属性的初始值可能在实例构造完成之后才会得到, 而常量属性在构造完成之前必须要有初始值, 因此常量属性无法声明为 lazy 属性
        */
        
        
        //计算属性
        
        var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
        let initialSquareCenter = square.center
        square.center = Point(x: 15.0, y: 15.0)
        
        
        
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
