//
//  206-链表翻转.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _06_____: NSObject {

    func reverseList(_ head: ListNode?) -> ListNode? {
        if(head == nil || head?.next == nil) {
            return head
        }
        
        var current = head
        var pre : ListNode? = nil
        var temp : ListNode? = nil
        while(current?.next != nil) {
            temp = current?.next
            current?.next = pre
            pre = current
            current = temp
        }
        return pre
    }
    
}
