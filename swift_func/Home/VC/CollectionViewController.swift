//
//  CollectionViewController.swift
//  swift_func
//
//  Created by mac on 2022/3/10.
//

import UIKit

class CollectionViewController: UIViewController {

    let _collectionView : UICollectionView = {
        
        let layout : UICollectionViewLayout = UICollectionViewLayout()
        
        let collection = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: layout)
        
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
