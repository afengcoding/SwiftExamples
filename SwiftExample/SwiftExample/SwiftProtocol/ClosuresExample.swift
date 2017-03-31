//
//  ClosuresExample.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/29.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

class ClosuresExample: UIViewController, XXXXXX {

    var closureX = 10
    
    
    static func URLDefProtocol() -> String {
        return "闭包"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = classForCoder.URLDefProtocol()
        view.backgroundColor = .white
        /**
         全局和嵌套函数实际上是一种特殊的闭包
         闭包的三种形式:
        num.1: “全局函数是一个有名字但不会捕获任何值的闭包”
         
        num.2: “嵌套函数是一个有名字并可以捕获其封闭函数域内值的闭包”
         
        num3:  “闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或常量值的匿名闭包”
         
         闭包表达式的风格: 
         1. 利用上下文推断参数和返回值类型
         2: 隐式返回单表达式闭包, 即单表达式闭包可以神略return关键字
         3: 参数名称缩写
         4: 尾随闭包语法
         
       */
        
        //系统的sorted 函数闭包
        let names = ["Chris", "Json", "Tom"]
        let namesResult = names.sorted { (a, b) -> Bool in
            a > b
        }
        print(namesResult)
        
        someFunctionThatTakesAClosure {
            
        }
        
        let digitNames = [
            0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
            5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
        ]
        let numbers = [16, 58, 510]
        
        let strings = numbers.map { (number) -> String in
            var number = number
            var output = ""
            repeat {
                output = digitNames[number % 10]! + output
                number /= 10
            } while number > 0
            
            return output
        }
        
        print(strings)
        
        
        /**
         值捕获
         闭包可以在其定义的是上下文中捕获常量和变量, 即定义这些常量和变量的原作用域已经不存在, 闭包任然可以在碧波啊函数体内引用和修改这些值
         */
        
        let incrementByTen = makeIncrement(forIncrement: 10)
        print(incrementByTen()) // 10
        print(incrementByTen()) // 20
        print(incrementByTen()) // 30
        
        //闭包是引用类型
        doSomething()
        print(closureX)
        completionHandlers.first?()
        print(closureX)
        
        //自动闭包
        var customerLine = ["Charis", "Alex", "Wwa", "Barry", "Daniella"]
        print(customerLine.count)
        
        let customerProvider = { customerLine.remove(at: 0)}
        print(customerLine.count)
        print("Now serving \(customerProvider())!")
        customerProvider()
        print(customerLine.count)
        
        
    }
    
    
    ///////////////////////////////////////////////////////////////////
    ///////////////////////////////////////////////////////////////////
    
    //MARK: -- 尾随闭包
    func someFunctionThatTakesAClosure(clourse:() -> Void) {
        
    }
    
    
    //MARK: -- 值捕获
    func makeIncrement(forIncrement amount: Int) -> () -> Int {
        var runningTotal = 0
        func increment() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return increment
    }
    
    //MARK: -- 逃逸闭包
    
    var completionHandlers: [() -> Void] = []
    func someFunctionWithEscapingClosure(completionHandler: @escaping ()-> Void) {
        completionHandlers.append(completionHandler)
    }
    
    func someFunctionWithNoneEscapingClosure(closure: () -> Void) {
        closure()
    }
    
    func doSomething() {
        //逃逸闭包必须显式使用self
        someFunctionWithEscapingClosure {
            self.closureX = 100
        }
        //非逃逸闭包 隐式使用self
        someFunctionWithNoneEscapingClosure {
            closureX = 200
        }
    }

    //MARK: 自动闭包
    
    
    
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
