//
//  account.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/21.
//

import Foundation

var percents : [Double] = [0, 0, 0, 0, 0, 0]

var inOutPercents : [Double] = [0, 0]

var inOutMoney : [Double] = [0, 0]

var cate = ["飲食", "交通", "娛樂", "生活", "其他", "收入"]


struct account: Identifiable, Codable {
    let id = UUID()
    var name: String
    var money: Int
    var categories: Int
    var week: Int
}
