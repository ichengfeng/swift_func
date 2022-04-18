//
//  007-整数反转.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _07_____: NSObject {
    func reverse(_ x: Int) -> Int {
        var n = 0;
        var m = x;
        while m != 0 {
            n = n*10 + m%10;
            m /= 10;
        }
        return n > (1<<31 - 1) || n < -(1<<31) ? 0 : n
    }
}
