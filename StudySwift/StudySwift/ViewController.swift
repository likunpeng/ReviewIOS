//
//  ViewController.swift
//  StudySwift
//
//  Created by lkp on 2017/12/11.
//  Copyright © 2017年 lkp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var reference1: Person?
    var reference2: Person?
    var reference3: Person?

    override func viewDidLoad() {
        super.viewDidLoad()

        reference1 = Person(name: "lkp")

        reference2 = reference1
        reference3 = reference1

        reference1 = nil
        reference2 = nil
        reference3 = nil

//        let digitNames = [
//            0: "Zero",1: "One",2: "Two",  3: "Three",4: "Four",
//            5: "Five",6: "Six",7: "Seven",8: "Eight",9: "Nine"
//        ]
//
//        let numbers = [16,58,510]
//
//        let strings = numbers.map {
//            (number) -> String in
//            var number = number
//            var output = ""
//            repeat {
//                output = digitNames[number % 10]! + output
//                number /= 10
//            } while number > 0
//            return output
//        }
//        print(strings)
        // Do any additional setup after loading the view, typically from a nib.
        
//        if let firstValue = Int("4") {
//            print("firstValue = \(firstValue)")
//        }
        
//        print("firstValue = \(_hashValue)")
        
//        let a = 1+ 2
        
//        let p = Person()
//        Person.testClass()
//        print(p.testReturn(a: 2))
        
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
        
//        for index in stride(from: 1, to: 6, by: 2) {
//            print(index)
//        }
        testStr()
    }

    func testStr() -> Void {
        let softWrappedQuotation = """


The White Rabbit put on his spectacles.  "Where shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the King said gravely, "and go on \
till you come to the end; then stop."





"""
        print(softWrappedQuotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

