//
//  HomeViewController.swift
//  swift_func
//
//  Created by mac on 2022/3/9.
//

import UIKit
import YYCategories
import MJRefresh

class HomeViewController: UIViewController {
        
    let tableView : UITableView = {
        let table = UITableView(frame: CGRect.zero, style: UITableView.Style.plain)
        table.separatorStyle = .none
        table.estimatedRowHeight = 64.ar
        table.rowHeight = UITableView.automaticDimension
        table.tableFooterView = UIView.init(frame: CGRect.zero)
        table.contentInsetAdjustmentBehavior = .never
        table.register(TextCell.self, forCellReuseIdentifier: "TextCell")
        
        let img = UIImageView(image: UIImage(named: "IMG_MIMI_1"))
        img.contentMode = .scaleAspectFill
        table.backgroundView = img
        return table
    }()
    
    var rows = 10
    var navShow = false
    let homeViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Home"
        self.navigationController?.navigationBar.isHidden = false
        
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self.view)
            make.left.right.equalTo(self.view)
            make.bottom.equalTo(self.view).offset(-Screen.safeAreaBottom()-49)
        }
        
        configRefresh()
        tableView.mj_header?.beginRefreshing()
    }
    
    
    func configRefresh() {
        tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: { [self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.featchData(refresh: true)
            }
        })
        
        let footer = MJRefreshAutoNormalFooter()
        footer.setTitle("", for: .idle)
        footer.isRefreshingTitleHidden = true
        footer.loadingView?.color = UIColor.gray
        footer.refreshingBlock = { [self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.featchData(refresh: false)
            }
        }
        tableView.mj_footer = footer
    }
    
    @objc func featchData(refresh: Bool) {
        if refresh == true {
            rows = 10
            tableView.mj_header?.endRefreshing()
            if tableView.mj_footer?.state == MJRefreshState.noMoreData {
                tableView.mj_footer?.resetNoMoreData()
            }
        }else {
            rows += 10
            if rows >= 30 {
                tableView.mj_footer?.endRefreshingWithNoMoreData()
            }else {
                tableView.mj_footer?.resetNoMoreData()
            }
        }
        
        tableView.reloadData()
    }
    
}

extension HomeViewController {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(navShow, animated: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension HomeViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY <= Screen.navBarHeight() {
            navShow = true
            self.navigationController?.setNavigationBarHidden(true, animated: true)
        }else {
            navShow = false
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextCell", for: indexPath) as! TextCell
        cell.selectionStyle = .none
        cell.title =  homeViewModel.getContentBy(index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row < rows {
            let scrollVC = ScrollViewController()
            scrollVC.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(scrollVC, animated: true)
        }
    }
}

class MineCell: UITableViewCell {
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
}
