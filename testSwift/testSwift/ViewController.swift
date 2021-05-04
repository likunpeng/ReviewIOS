//
//  ViewController.swift
//  testSwift
//
//  Created by 李坤鹏 on 2021/4/21.
//  Copyright © 2021 李坤鹏. All rights reserved.
//

import UIKit

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        var arr = [1, 1, 2]
//        print(removeDuplicates(&arr))
//        print(arr)
//        let arr1 = [-1, -2, -3, -4, -5]
//        print(twoSum(arr1, -8))
        
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        let val1 = l1?.val
        let val2 = l2?.val
        guard val1 != nil || val2 != nil else {
            return nil
        }
        let sum = (val1 ?? 0) + (val2 ?? 0)
        let digit = sum % 10
        let l1Next: ListNode? = {
            if sum - digit != 0 {
                let l1Next = l1?.next ?? ListNode(0)
                l1Next.val += 1
                return l1Next
            } else {
                return l1?.next
            }
        }()
        let result = ListNode(digit)
        result.next = addTwoNumbers(l1Next, l2?.next)
        return result
    }
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var i = 0;
        while i < nums.count - 1 {
            var j = i + 1;
            while j < nums.count {
                if nums[i] + nums[j] == target {
                    return [i, j]
                }
                j += 1
            }
            i += 1;
        }
        return [0]
    }
    
  func removeDuplicates(_ nums: inout [Int]) -> Int {
        var p = 0
        var q = 1
        while q  < nums.count {
           if(nums[p] != nums[q]) {
               nums[p+1] = nums[q]
               p += 1
           }
           q += 1
        }
        return p + 1
    }


}



