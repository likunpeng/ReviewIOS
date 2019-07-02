//
//  Person.swift
//  StudySwift
//
//  Created by lkp on 2017/12/14.
//  Copyright © 2017年 lkp. All rights reserved.
//

import Foundation

class Person {
    let name: String

    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }

    deinit {
        print("\(name) is being deinitialized")
    }
}
