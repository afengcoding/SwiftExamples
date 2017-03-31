//
//  RootViewController.swift
//  SwiftExample
//
//  Created by qddios2 on 17/3/21.
//  Copyright © 2017年 lvguifeng. All rights reserved.
//

import UIKit


let cellID = "example.cell.id"



class RootViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    lazy var tableView: UITableView = {
        let table = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    lazy var dataArray: Array<String> = {
        var ary = [String]()
        return ary
    }()
    
    // MARK: --life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift 知识点"
        view.backgroundColor = .white
        view.addSubview(tableView)
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        loadDataArray()
        print(dataArray)
        tableView.reloadData()
        
    }
    
    
    // MARK: --UITableViewDelegate
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = dataArray[indexPath.row]
        return cell;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myClass = dataArray[indexPath.row]
        let classType = NSClassFromString(myClass) as? UIViewController.Type
        if let type = classType {
            let newVC = type.init()
            navigationController?.pushViewController(newVC, animated: true)
        }
        
    }
    
    func loadDataArray() {
        var classCount: UInt32 = 0
        let classes = objc_copyClassList(&classCount)
        for i  in 0..<classCount {
            let cls: AnyClass = classes![Int(i)]!
            if class_conformsToProtocol(cls, XXXXXX.self) {
                self.dataArray.append(String.init(cString: class_getName(cls)))
            }
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
