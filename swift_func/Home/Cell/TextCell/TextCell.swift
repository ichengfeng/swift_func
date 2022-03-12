//
//  TextCell.swift
//  swift_func
//
//  Created by mac on 2022/3/10.
//

import UIKit

class TextCell: UITableViewCell {
    
    var title : String? {
        didSet{
            titleLabel.text = title
        }
    }
    
    var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = UIColor.orange
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 18.ar, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clear
        self.contentView.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets.init(top: 12.ar, left: 12.ar, bottom: 12.ar, right: 12.ar))
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
