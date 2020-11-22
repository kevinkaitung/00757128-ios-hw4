//
//  chart.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/21.
//

import SwiftUI

struct chart: View {
    @ObservedObject var accountsData = accountData()
    
    init(Accounts: accountData){
        for i in 0..<cate.count {
            percents[i] = 0
        }
        var total : Double = 0
        for i in 0..<Accounts.accounts.count {
            percents[Accounts.accounts[i].categories] += Double(Accounts.accounts[i].money)
        }
        for i in 0..<cate.count - 1 {
            total += percents[i]
        }
        for i in 0..<cate.count - 1 {
            percents[i] = percents[i] / total * 100
        }
    }
    
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 220/255)
            VStack {
                Text("支出統計").font(.title)
                HStack {
                    Spacer()
                    PieChartView(percentages: percents)
                        .frame(width: 150, height: 150, alignment: .leading)
                    Spacer()
                    VStack {
                        HStack {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 10, height: 10)
                            if percents[0].isNaN {
                                Text("飲食 0%")
                            }
                            else {
                                Text("飲食 \(Int(percents[0]))%")
                            }
                        }
                        HStack {
                            Circle()
                                .fill(Color.green)
                                .frame(width: 10, height: 10)
                            if percents[1].isNaN {
                                Text("交通 0%")
                            }
                            else {
                                Text("交通 \(Int(percents[1]))%")
                            }
                        }
                        HStack {
                            Circle()
                                .fill(Color.yellow)
                                .frame(width: 10, height: 10)
                            if percents[2].isNaN {
                                Text("娛樂 0%")
                            }
                            else {
                                Text("娛樂 \(Int(percents[2]))%")
                            }
                        }
                        HStack {
                            Circle()
                                .fill(Color.orange)
                                .frame(width: 10, height: 10)
                            if percents[3].isNaN {
                                Text("生活 0%")
                            }
                            else {
                                Text("生活 \(Int(percents[3]))%")
                            }
                        }
                        HStack {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 10, height: 10)
                            if percents[4].isNaN {
                                Text("其他 0%")
                            }
                            else {
                                Text("其他 \(Int(percents[4]))%")
                            }
                        }
                    }
                    Spacer()
                }
            }
        }
    }
}
