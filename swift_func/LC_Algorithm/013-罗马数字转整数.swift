//
//  013-罗马数字转整数.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _13________: NSObject {
    func romanToInt(_ s: String) -> Int {
        var dict = Dictionary<String, Int>()
        dict["I"] = 1;
        dict["V"] = 5;
        dict["X"] = 10;
        dict["L"] = 50;
        dict["C"] = 100;
        dict["D"] = 500;
        dict["M"] = 1000;
        dict["A"] = 4;
        dict["B"] = 9;
        dict["E"] = 40;
        dict["N"] = 90;
        dict["P"] = 400;
        dict["Q"] = 900;
        let Str = s.replacingOccurrences(of: "IV", with: "A").replacingOccurrences(of: "IX", with: "B").replacingOccurrences(of: "XL", with: "E").replacingOccurrences(of: "XC", with: "N").replacingOccurrences(of: "CD", with: "P").replacingOccurrences(of: "CM", with: "Q")
        var sum = 0;
        for value in Str.map({String($0)}) {
            sum += dict[value]!
        }
        
        return sum
    }
}
