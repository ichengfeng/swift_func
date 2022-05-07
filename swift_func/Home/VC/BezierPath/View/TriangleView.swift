//
//  TriangleView.swift
//  swift_func
//
//  Created by mac on 2022/4/18.
//

import UIKit

class TriangleView: UIView {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let ctx : CGContext = UIGraphicsGetCurrentContext()!
        
        let path : UIBezierPath = UIBezierPath.init()
        let startPoint = CGPoint(x: 110, y: 10)
        path.move(to: startPoint)
        path.addLine(to: CGPoint(x: 190, y: 120))
        path.addLine(to: CGPoint(x: 270, y: 10))
        path.close()
        
        ctx.addPath(path.cgPath)
        UIColor.orange.setFill()
        UIColor.red.setStroke()
        ctx.setLineWidth(15)
        
        ctx.drawPath(using: .fill)
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
