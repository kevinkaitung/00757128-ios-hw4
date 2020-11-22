//
//  chartBalance.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/22.
//

import SwiftUI

struct chartBalance: View {
    @ObservedObject var accountsData = accountData()
    @State private var outEnd: CGFloat = 0
    @State private var inEnd: CGFloat = 0
    
    init(Accounts: accountData){
        inOutPercents[0] = 0
        inOutPercents[1] = 0
        inOutMoney[0] = 0
        inOutMoney[1] = 0
        var total : Double = 0
        for i in 0..<Accounts.accounts.count {
            if Accounts.accounts[i].categories != 5 {
                inOutMoney[0] += Double(Accounts.accounts[i].money)
            }
            else {
                inOutMoney[1] += Double(Accounts.accounts[i].money)
            }
        }
        total = inOutMoney[0] + inOutMoney[1]
        inOutPercents[0] = inOutMoney[0] / total * 100
        inOutPercents[1] = inOutMoney[1] / total * 100
    }
    var body: some View {
        ZStack {
            Color(red: 245/255, green: 245/255, blue: 220/255)
            VStack {
                Text("收支統計").font(.title)
                HStack {
                    VStack{
                        ZStack(alignment: .bottom) {
                            Capsule()
                                .frame(width: 20, height: 150)
                                .foregroundColor(.gray)
                            Capsule()
                                .frame(width: 20, height: outEnd)
                                .foregroundColor(.blue)
                                .animation(.linear(duration: 0.5))
                                .onAppear {
                                    if inOutPercents[0].isNaN {
                                        outEnd = 0
                                    }
                                    else
                                    {
                                        outEnd = CGFloat(inOutPercents[0]) * 1.5
                                    }
                                }
                        }
                        .padding(5.0)
                        Text("支出")
                        if inOutMoney[0].isNaN {
                            Text("0")
                        }
                        else
                        {
                            Text("\(Int(inOutMoney[0]))")
                        }
                    }
                    VStack{
                        ZStack(alignment: .bottom) {
                            Capsule()
                                .frame(width: 20, height: 150)
                                .foregroundColor(.gray)
                            Capsule()
                                .frame(width: 20, height: inEnd)
                                .foregroundColor(.green)
                                .animation(.linear(duration: 0.5))
                                .onAppear {
                                    if inOutPercents[1].isNaN {
                                        inEnd = 0
                                    }
                                    else
                                    {
                                        inEnd = CGFloat(inOutPercents[1]) * 1.5
                                    }
                                }
                        }
                        .padding(5.0)
                        Text("收入")
                        if inOutMoney[1].isNaN {
                            Text("0")
                        }
                        else
                        {
                            Text("\(Int(inOutMoney[1]))")
                        }
                    }
                }
                if inOutMoney[0] > inOutMoney[1] {
                    Text("這個月已經超支了！")
                        .foregroundColor(.red)
                        .padding(5.0)
                }
            }
        }
    }
}

