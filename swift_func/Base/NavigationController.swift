//
//  NavigationController.swift
//  Algorithm
//
//  Created by mac on 2022/2/9.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
