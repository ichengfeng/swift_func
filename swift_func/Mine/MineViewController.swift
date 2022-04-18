//
//  MineViewController.swift
//  swift_func
//
//  Created by mac on 2022/3/9.
//

import UIKit

class MineViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Mine"
        
    }
    

    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        if(head == nil) {
            return nil
        }
        var slow = head,  fast = head
        while(fast != nil) {
            if(fast!.val != slow!.val) {
                slow!.next = fast
                slow = slow!.next
            }
            fast = fast!.next
        }
        slow!.next = nil
        return head
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
