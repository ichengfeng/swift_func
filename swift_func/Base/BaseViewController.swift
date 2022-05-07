//
//  BaseViewController.swift
//  swift_func
//
//  Created by mac on 2022/5/7.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
    }
    
    func pageJumpTo(nibName: String) {
        let controller : BaseViewController = createObjWithClassName(nibName) as! BaseViewController
        controller.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(controller, animated: true)
    }


    // MARK: 使用类名实例化对象
    func createObjWithClassName(_ className: String) -> NSObject {
        // 动态获取命名空间
        guard var spaceName = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else {
            print("获取命名空间失败")
            return NSObject()
        }
        spaceName = spaceName + "."
        // className:表示试图控制器的类名
        var vcClass: AnyClass?
        if className.contains(spaceName) {
            vcClass = NSClassFromString(className)
        } else {
            vcClass = NSClassFromString(spaceName + className)
        }
        // Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
        guard let typeClass = vcClass as? NSObject.Type else {
            print("vcClass不能当做UIViewController")
            return NSObject()
        }
        
        let createVC = typeClass.init()
        return createVC
    }

}
