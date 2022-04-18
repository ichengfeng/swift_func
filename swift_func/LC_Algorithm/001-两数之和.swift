//
//  001-两数之和.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _01_____: NSObject {

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var temps: [Int] = []
        for (vIndex ,value) in nums.enumerated() {
            let t = target - value
            for (nIndex ,number) in nums.enumerated() {
                if number == t && nIndex != vIndex {
                    temps = [vIndex,nIndex]
                }
            }
        }
        return temps
    }
    
}
