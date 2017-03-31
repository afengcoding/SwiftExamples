//
//  DataModel.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/22.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

class DataModel: NSObject {

    init(dic: [String:Any]) {
        super.init()
        setValuesForKeys(dic)
    }
    
}
