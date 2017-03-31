//
//  FunctionExampleViewController.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/29.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

class FunctionExampleViewController: UIViewController, XXXXXX {

    static func URLDefProtocol() -> String {
        return "FunctionExample"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = classForCoder.URLDefProtocol()
        view.backgroundColor = .white
        showAlertMsg(message: greet(person: "Simple"))
        
        let array = [4, 3, 2, 19]
        let result = minMax(array)
        print("min number is \(result?.min), max number is \(result?.max)")
        //或者 形如绑定的形式
        if let bounds = minMax(array) {
            print("min number is \(bounds.min), max number is \(bounds.max)")
        }
        
        //可变参数
        
        let average = aritmeticMean(1, 2 , 3, 4)
        print(average)
        
        //输入输出函数
        var aValue = 3
        var bValue = 5
        swapTwoInts(&aValue, &bValue)
        print("aValue current value is \(aValue), bValue current value is \(bValue)")
        
        //函数类型
        var mathFunction: (Int, Int)-> Int = addTwoInts
        print("reult: \(mathFunction(aValue, bValue))")
        mathFunction = multipyTwoInts
        print("reult: \(mathFunction(aValue, bValue))")
        
        //函数类型作为参数
        printMathResult(mathFunction, aValue, bValue)
        
    
    }
    
    func greet(person: String) -> String {
        let greeting = "hello," + person + "!"
        return greeting
    }
    
    func showAlertMsg(message: String) {
        let alertView = UIAlertView.init(title: message, message: nil, delegate: nil, cancelButtonTitle: "Cannel")
        alertView.show()
        
    }
    
    //最小最大函数 可选类型
    func minMax(_ array: [Int]) -> (min: Int, max: Int)? {
        if array.isEmpty {
            return nil
        }
        var min = array[0]
        var max = array[0]
        for item in array {
            if item < min {
                min = item
            } else if item > max {
                max = item
            }
        }
        return (min, max)
    }
    
    
    //默认参数值
    func someFunction(parameterWithoutDefaultValue: Int, parameterWithDefaultValue: Int = 12)  {
        
    }
    
    //可变参数
    func aritmeticMean(_ numbers: Double...) -> Double {
        var total: Double = 0.0
        for number in numbers {
            total += number
        }
        return total / Double(numbers.count)
    }

    
    //交换两个数的值
    func swapTwoInts(_ a: inout Int, _ b: inout Int) {
        let tem = a
        a = b
        b = tem
    }
    
    
    //函数类型 addTwoInts 和 multipyTwoInts 函数类型是一样的 (int, int)->int
    func addTwoInts(_ a: Int, _ b: Int) -> Int {
        return a + b
    }
    
    func multipyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    //函数类型做为参数
    func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
        print("result: \(mathFunction(a, b))")
    }
    
    
    //MARK: -- 函数做为返回值
    func stepForward(_ input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(_ input: Int) -> Int {
        return input - 1
    }
    
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward : stepForward
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
