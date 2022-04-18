//
//  027-移除元素.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _27_____: NSObject {
    
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var slowIndex = 0

        for fastIndex in 0..<nums.count {
            if val != nums[fastIndex] {
                if slowIndex != fastIndex {
                    nums[slowIndex] = nums[fastIndex]
                }
                slowIndex += 1
            }
        }
        return slowIndex
    }
}
