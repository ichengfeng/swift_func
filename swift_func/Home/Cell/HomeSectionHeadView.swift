//
//  HomeSectionHeadView.swift
//  swift_func
//
//  Created by mac on 2022/3/23.
//

import UIKit

class HomeSectionHeadView: UICollectionReusableView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 18.ar, weight: .medium)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(12.ar)
            make.bottom.right.equalToSuperview()
            make.top.equalToSuperview().offset(12.ar)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
