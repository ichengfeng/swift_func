//
//  HomeItemCell.swift
//  swift_func
//
//  Created by mac on 2022/3/23.
//

import UIKit

class HomeItemCell: UICollectionViewCell {
    
    let bgImg : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.font = UIFont.systemFont(ofSize: 12.ar, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        bgImg.image = UIImage(named: "video_h")?.byTintColor(UIColor.orange)
        self.contentView.addSubview(bgImg)
        bgImg.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.width.height.equalTo(25.ar)
        }
        
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.centerX.equalTo(bgImg)
            make.width.equalToSuperview()
            make.height.equalTo(18.ar)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
