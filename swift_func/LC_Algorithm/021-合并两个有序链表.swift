//
//  021-合并两个有序链表.swift
//  swift_func
//
//  Created by mac on 2022/3/24.
//

import UIKit

class _21_________: NSObject {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if l1?.next == nil || l2?.next == nil {
            return l1?.next == nil ? l2 : l1 
        }
        
        let head : ListNode = ((l1!.val < l2!.val) ? l1 : l2)!
        head.next = mergeTwoLists(head.next, l1!.val < l2!.val ? l2 : l1)
        return head
    }
}
