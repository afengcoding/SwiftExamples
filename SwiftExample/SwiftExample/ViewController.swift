//
//  ViewController.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/21.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit


class Shape  {
    var numberOfSides = 0
    var name: String
    
    //构造函数
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
    
    deinit {
        
    }
}


class Square: Shape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength =  sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

class EquilateraTriangle: Shape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        
        set {
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral tiagle with sides of length \(sideLength)"
    }
    
    
    
}


class TriangleAndSquare {
    var triangle: EquilateraTriangle {
        willSet {
           square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateraTriangle(sideLength: size, name: name)
    }
    
    
}


////协议
//protocol ExampleProtocol {
//    var simpleDescription: String { get }
//    mutating func addjust()
//    
//}
//
////扩展
//extension Int: ExampleProtocol {
//    var simpleDescription: String {
//        return "The number is \(self)"
//    }
//    
//    mutating func addjust() {
//        self += 42
//    }
//    
//}

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        whileRpeatFunction()
       let greetString =  greet(person: "Simple", day: "2017.03.20")
        print(greetString)
        
        let statistics = calculateStatistics(scores: [10, 45, 2, 6,78])
        print(statistics.max)
        
        let sum = sumOf(numbers: 12, 45)
        print(sum)
        
        let returnValue = returnFifteen()
        print(returnValue)
        
        let increment = makeIncrementer()
        let incrementValue = increment(7)
        print(incrementValue)
        
        
        let numbers = [5, 45, 12, 9, 25]
        let result =  hasAnyMatches(list: numbers, condition: lessThanThen)
        if result {
            print("It is lessThanTen")
        }
        
        //数组map flatMap 函数
       let mapperdNum =  numbers.map({
            (number: Int) -> Int in
            let result = 3 * number
            return result
        })
        
        print(mapperdNum)
        
        //通过参数位置而不是参数名字 
        let sortAry = [7, 9]
        let sortedNumbers = sortAry.sorted(by: >)
        print(sortedNumbers)
        
        
        /************************* 类和对象 **********************/
        let shape  = Shape.init(name: "Simple")
        shape.numberOfSides = 7
        let simpleDes = shape.simpleDescription()
        print(simpleDes)
        
        
        let test = Square.init(sideLength: 5.2, name: "my test square")
        test.area()
        let testDes = test.simpleDescription()
        print(testDes)
        
        let  trangle = EquilateraTriangle(sideLength: 3.1, name: "a triangle")
        print(trangle.perimeter)
        trangle.perimeter = 9.9
        print(trangle.sideLength)
        
        var triangleAndSquare = TriangleAndSquare(size: 10, name: "another")
        print(triangleAndSquare.square.sideLength)
        print(triangleAndSquare.triangle.sideLength)
        triangleAndSquare.square = Square(sideLength: 5, name: "larger")
        print(triangleAndSquare.square.sideLength)
        
//        var  a = 7
//        a.addjust()
//        print(a.simpleDescription)
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // 控制流 repeat while 循环
    
    //C语言的while循环 先判断条件 再执行循环体
    func whileRpeatFunction() {
        var n = 101
        while n < 100 {
            n = n * 2
        }
        
        print(n)
        
        //相当于C语言的do while 先执行语句 再判读条件
        var m = 101
        repeat {
            m = m * 2
        } while m < 100
        
        print(m)
        
        // for 循环 用 a...b 表示 从a 到 b 包含b
        // 用a..< b 表示 从a 到 b 不包含b
        for i in 0...4 {
            print(i)
        }
        
        for i  in 0..<4 {
            print(i)
        }
        
    }
    
    func greet(person: String, day: String) -> String {
        return "hello \(person), today is \(day)"
    }
    
    
    //用元组 返回多个值
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
        var min = scores[0]
        var max = scores[0]
        var sum = 0
        for score in scores {
            if score > max {
                max = score
            } else if score < min {
                min = score
            }
            sum += score
        }
        
        return (min, max, sum)
    }
    
    //可变参数
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers {
            sum += number
        }
        return sum
        
    }
    
    
    //函数嵌套
    func returnFifteen() -> Int {
        var y = 10
        func add() {
            y += 5
        }
        
        add()
        return y
        
    }
    
    //函数是一等类型 函数可以作为返回值 
    func makeIncrementer() -> ((Int) -> Int) {
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        return addOne
    }
    
    //函数作为参数
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    func lessThanThen(number: Int) -> Bool {
        return number < 10
    }
    
   

}

