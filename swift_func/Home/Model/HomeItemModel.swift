//
//  HomeItemModel.swift
//  swift_func
//
//  Created by mac on 2022/5/7.
//

import UIKit

struct HomeSectionModel {
    var sectionTitle : String?
    var items : Array<HomeItemModel>?
}

//"title": "充值中心", "image": "世界"
struct HomeItemModel {
    var title : String?
    var image : String?
    var routeName : String?
}

