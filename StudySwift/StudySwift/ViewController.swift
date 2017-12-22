//
//  ViewController.swift
//  StudySwift
//
//  Created by lkp on 2017/12/11.
//  Copyright © 2017年 lkp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let p = Person()
        Person.testClass()
        print(p.testReturn(a: 2))
        
//        let a = Animal()
//        let arr = [1,2,3]
//        for _ in arr {
//
//        }
//        for(int i = 0 ; i < 10; i++){
//
//            // 你需要做的操作
//        }
//        for i in 0..<arr.count {
//
//        }
        
        for index in stride(from: 1, to: 6, by: 2) {
            print(index)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

