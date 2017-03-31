//
//  InitExample.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/30.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit

class SurveyQuestion {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}


class InitExample: UIViewController, XXXXXX {

    static func URLDefProtocol() -> String {
        return "构造方法"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = classForCoder.URLDefProtocol()
        view.backgroundColor = UIColor.white
        
        let beetsQuestion = SurveyQuestion(text: "How about beets")
        beetsQuestion.ask()
        
        
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
