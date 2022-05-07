//
//  CircleView.swift
//  swift_func
//
//  Created by mac on 2022/4/18.
//

import UIKit

class CircleView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let context = UIGraphicsGetCurrentContext()
        let path = UIBezierPath.init(ovalIn: CGRect(x: 10, y: 10, width: 120, height: 120))
        context?.addPath(path.cgPath)
        UIColor.orange.setStroke()
        context?.strokePath()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
