//
//  BezierPathTestController.swift
//  swift_func
//
//  Created by mac on 2022/5/7.
//

import UIKit

class BezierPathTestController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Mine"
        
        let scrollView = UIScrollView()
        scrollView.contentSize = CGSize(width: kScreenWidth, height: kScreenHeight*2)
        self.view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.top.equalTo(Screen.navBarHeight())
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-Screen.tabBarHeight())
        }
        
        
        let triangleView : TriangleView = TriangleView()
        triangleView.backgroundColor = UIColor.white
        scrollView.addSubview(triangleView)
        triangleView.snp.makeConstraints { make in
            make.top.left.equalToSuperview()
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(140)
        }
        
        
        let rectangleView : RectangleView = RectangleView()
        rectangleView.backgroundColor = UIColor.white
        scrollView.addSubview(rectangleView)
        rectangleView.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.top.equalTo(triangleView.snp_bottomMargin).offset(10.ar)
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(140)
        }
     
        
        let circleView : CircleView = CircleView()
        circleView.backgroundColor = UIColor.white
        scrollView.addSubview(circleView)
        circleView.snp.makeConstraints { make in
            make.left.bottom.equalToSuperview()
            make.top.equalTo(rectangleView.snp_bottomMargin).offset(10.ar)
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(140)
        }
    }

}
