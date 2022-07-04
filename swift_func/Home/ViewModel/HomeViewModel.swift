//
//  HomeViewModel.swift
//  swift_func
//
//  Created by mac on 2022/3/10.
//

import UIKit

class HomeViewModel: NSObject {
    
    let itemList = [
        [
            "sectionTitle": "便民生活",
            "items" : [
                ["title": "充值中心", "image": "世界"],
                ["title": "生活缴费", "image": "世界"],
                ["title": "健康码", "image": "世界"],
                ["title": "市民中心", "image": "世界"],
                ["title": "我的快递", "image": "世界"],
                ["title": "医疗健康", "image": "世界"],
                ["title": "菜鸟", "image": "世界"],
                ["title": "哈啰出行", "image": "世界"],
                ["title": "铁路12306", "image": "世界"],
                ["title": "高德打车", "image": "世界"],
                ["title": "飞猪旅行", "image": "世界"],
                ["title": "交管12123", "image": "世界"],
                ["title": "车生活", "image": "世界"],
                ["title": "国家政务网", "image": "世界"],
                ["title": "国务院客户端", "image": "世界"],
                ["title": "医保", "image": "世界"],
            ]
        ],
        [
            "sectionTitle": "购物娱乐",
            "items" : [
                ["title": "饿了吗", "image": "世界"],
                ["title": "电影演唱", "image": "世界"],
                ["title": "消费券", "image": "世界"],
                ["title": "陶特", "image": "世界"],
                ["title": "彩票", "image": "世界"],
                ["title": "支付宝会员", "image": "世界"],
                ["title": "口碑好店", "image": "世界"],
                ["title": "体育服务", "image": "世界"],
                ["title": "大牌直降", "image": "世界"],
                ["title": "天猫同城购", "image": "世界"],
            ]
        ],
        [
            "sectionTitle": "财富管理",
            "items" : [
                ["title": "花呗", "image": "世界"],
                ["title": "借呗", "image": "世界"],
                ["title": "基金", "image": "世界"],
                ["title": "转账", "image": "世界"],
                ["title": "余额宝", "image": "世界"],
                ["title": "信用卡还款", "image": "世界"],
                ["title": "芝麻信用", "image": "世界"],
                ["title": "红包", "image": "世界"],
                ["title": "网商银行", "image": "世界"],
                ["title": "股票", "image": "世界"],
                ["title": "余利宝", "image": "世界"],
                ["title": "蚂蚁保", "image": "世界"],
                ["title": "理财产品", "image": "世界"],
                ["title": "支付宝荷包", "image": "世界"],
            ]
        ],
        [
            "sectionTitle": "教育公益",
            "items" : [
                ["title": "蚂蚁森林", "image": "世界"],
                ["title": "运动", "image": "世界"],
                ["title": "蚂蚁庄园", "image": "世界"],
                ["title": "芭芭农场", "image": "世界"],
                ["title": "3小时公益", "image": "世界"],
                ["title": "爱心捐赠", "image": "世界"],
                ["title": "蚂蚁新村", "image": "世界"],
                ["title": "校园派", "image": "世界"],
            ]
        ],
    ]
    
    var dataArray : Array<HomeSectionModel> = []
    
    override init() {
        super.init()
        
        let sectionTitles = ["UI组件","功能尝试","代码调试"];
        let allFuncs = [
            [
                "BezierPath":"BezierPathTestController",
                "Button" : "",
                "Label" : "",
                "Image" : "",
            ],
            [
                "MVC" : "",
                "MVVM" : "",
                "MVP" : "",
                "MVCS" : ""
            ],
            [
                "Navigation" : "",
                "TabBar" : "",
                "Category" : "",
                "ActionView" : ""
            ]
        ]
        
        for sectionTitle in sectionTitles {
        
            var cells : Array<HomeItemModel> = []
            
            let section = sectionTitles.firstIndex(of: sectionTitle)
            for (funcName,route) in allFuncs[section!] {
                let itemModel : HomeItemModel = HomeItemModel(title: funcName, image: "", routeName: route)
                cells.append(itemModel)
            }
            let sectionModel : HomeSectionModel = HomeSectionModel(sectionTitle: sectionTitle, items: cells)
            dataArray.append(sectionModel)
        }
        
    }
    
    func sectionCount() -> NSInteger {
        return dataArray.count
    }
    
    func rowCount(section: NSInteger) -> NSInteger {
        let sectionModel : HomeSectionModel = getSectionData(section: section);
        return sectionModel.items?.count ?? 0
    }
    
    func getSectionData(section: NSInteger) -> HomeSectionModel {
        return dataArray[section]
    }
    
    func getSectionHeadTitle(section: NSInteger) -> String {
        let sectionModel = getSectionData(section: section)
        return sectionModel.sectionTitle ?? ""
    }
    
    func getRowData(indexPath: IndexPath) -> HomeItemModel {
        let sectionModel = getSectionData(section: indexPath.section)
        let rowModel = sectionModel.items![indexPath.row]
        return rowModel
    }
    
}
