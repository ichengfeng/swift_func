//
//  RectangleView.swift
//  swift_func
//
//  Created by mac on 2022/4/18.
//

import UIKit

class RectangleView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let ctx = UIGraphicsGetCurrentContext()
        
        let path = UIBezierPath(rect: CGRect(x: 10, y: 10, width: 120, height: 120));
        
        ctx?.addPath(path.cgPath)
        UIColor.orange.setFill()
        
        ctx?.drawPath(using: .fill)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
