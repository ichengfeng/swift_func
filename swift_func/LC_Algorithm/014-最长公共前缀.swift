//
//  014-最长公共前缀.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _14_______: NSObject {
    func longestCommonPrefix(_ strs: [String]) -> String {
        var i = 0
        var has = true
        var minStr = ""
        if let min = strs.min(by: {$1.count > $0.count}) {
            minStr = min
        }
        while i < minStr.count+1 && has == true {
            i+=1;
            for value in strs {
                if (value.prefix(i) != minStr.prefix(i) || i >= minStr.count+1) {
                    has = false
                    break
                }
            }
        }
        return String(!has ? minStr.prefix(i-1) : "")
    }
}
