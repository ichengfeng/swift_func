//
//  HomeViewController.swift
//  swift_func
//
//  Created by mac on 2022/3/9.
//

import UIKit
import YYCategories
import MJRefresh

class HomeViewController: BaseViewController {

    let mainCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 12.ar, left: 12.ar, bottom: 0.ar, right: 12.ar)
        layout.headerReferenceSize = CGSize(width: kScreenWidth, height: 30.ar)
        layout.footerReferenceSize = CGSize(width: kScreenWidth, height: 12.ar)
        
        layout.itemSize = CGSize(width: (kScreenWidth-6.ar*3-12*2.ar)/4, height: 49.ar)
        layout.minimumInteritemSpacing = 6.ar
        layout.minimumLineSpacing = 16.ar
        
         
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.register(HomeItemCell.self, forCellWithReuseIdentifier: "HomeItemCell")
        collection.register(HomeSectionHeadView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeadView")
        collection.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "SectionFooterView")
        
        return collection
    }()

    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "首页"
        self.navigationController?.navigationBar.isHidden = false
        
        mainCollection.dataSource = self
        mainCollection.delegate = self
        self.view.addSubview(mainCollection)
        mainCollection.snp.makeConstraints { make in
            make.edges.equalTo(self.view)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return homeViewModel.sectionCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel.rowCount(section: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if (kind == UICollectionView.elementKindSectionHeader) {
            let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "SectionHeadView", for: indexPath) as! HomeSectionHeadView
            sectionHeader.titleLabel.text = homeViewModel.getSectionHeadTitle(section: indexPath.section)
            return sectionHeader
        } else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "SectionFooterView", for: indexPath)
            footerView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 12.ar)
            return footerView
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeItemCell", for: indexPath) as! HomeItemCell
        let rowModel : HomeItemModel = homeViewModel.getRowData(indexPath: indexPath)
        cell.titleLabel.text = rowModel.title
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let rowModel : HomeItemModel = homeViewModel.getRowData(indexPath: indexPath)
        guard rowModel.routeName != nil && rowModel.routeName!.count > 0 else {
            return
        }
        pageJumpTo(nibName: rowModel.routeName!)
    }
    
}
