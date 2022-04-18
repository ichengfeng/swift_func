//
//  026-删除有序数组中的重复项.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _26____________: NSObject {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        if(nums.count == 0) {
            return 0
        }
        
        var slow = 0; var fast = 0
        while(fast < nums.count) {
            if(nums[fast] != nums[slow]) {
                slow += 1
                nums[slow] = nums[fast]
            }
            fast += 1
        }
        return slow+1
    }
}
