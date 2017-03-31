//
//  EnumerationExample.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/30.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

enum CompassPoint {
    case north, south, east, west
}

//MARK:-- 关联值枚举
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

//MARK: -- 原始值
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//MARK: -- 递归枚举

/// 枚举
///
/// - number: 成员变量
/// addition 是可递归的成员变量 如果把indirect放在枚举类型的前面 则所有成员变量都可以递归
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

class EnumerationExample: UIViewController, XXXXXX{

    static func URLDefProtocol() -> String {
        return "枚举"
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = classForCoder.URLDefProtocol()
        directionFunction()
        
        //关联值
        var productBarcode = Barcode.upc(1, 8599, 5216, 3)
        productBarcode = .qrCode("AFGGGEDSAG")
        productBarcodeFunction(barcode: productBarcode)
        
        /** 原始值
         “作为关联值的替代选择，枚举成员可以被默认值（称为原始值）预填充，这些原始值的类型必须相同”
         “原始值和关联值是不同的。原始值是在定义枚举时被预先填充的值，像上述三个 ASCII 码。对于一个特定的枚举成员，它的原始值始终不变。关联值是创建一个基于枚举成员的常量或变量时才设置的值，枚举成员的关联值可以变化”
        */
        
        //递归枚举 存储的表达式是(5+ 4) * 2
        let five = ArithmeticExpression.number(5)
        let four = ArithmeticExpression.number(4)
        let sum = ArithmeticExpression.addition(five, four)
        let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))
         print(evaluate(product))
        
    }

    func directionFunction() {
        let  directionHead: CompassPoint = .east
        switch directionHead {
        case .north:
            print("north")
        case .south:
            print("south")
        case .east:
            print("east")
        case .west:
            print("west")
        }
    }
    
    func productBarcodeFunction(barcode: Barcode) {
        switch barcode {
        case .upc(let nusystem , let manufacturer, let product, let check):
            print("UPC: \(nusystem), \(manufacturer), \(product), \(check)")
        case .qrCode(let productCode):
            print("QR code: \(productCode)")
            
        }
    }
    
    func evaluate(_ expression: ArithmeticExpression) -> Int {
        switch expression {
        case let .number(value):
            return value
        case let .addition(lef , right):
            return evaluate(lef) + evaluate(right)
        case let .multiplication(left, right):
            return evaluate(left) * evaluate(right)
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
