//
//  accountRow.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/21.
//

import SwiftUI

struct accountRow: View {
    var anAccount: account
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(anAccount.name)
                    .font(.title)
                Spacer()
                if anAccount.categories != 5 {
                    Text("- \(anAccount.money)")
                        .font(.title)
                }
                else {
                    Text("+ \(anAccount.money)")
                        .font(.title)
                }
            }
            HStack {
                Text("類別：" + cate[anAccount.categories])
                    .foregroundColor(.gray)
                if anAccount.week == 1 {
                    Text("星期一")
                        .foregroundColor(.gray)
                }
                else if anAccount.week == 2 {
                    Text("星期二")
                        .foregroundColor(.gray)
                }
                else if anAccount.week == 3 {
                    Text("星期三")
                        .foregroundColor(.gray)
                }
                else if anAccount.week == 4 {
                    Text("星期四")
                        .foregroundColor(.gray)
                }
                else if anAccount.week == 5 {
                    Text("星期五")
                        .foregroundColor(.gray)
                }
                else if anAccount.week == 6 {
                    Text("星期六")
                        .foregroundColor(.gray)
                }
                else {
                    Text("星期日")
                        .foregroundColor(.gray)
                }
            }.padding(.all, 3.0)
        }
    }
}

struct accountRow_Previews: PreviewProvider {
    static var previews: some View {
        accountRow(anAccount: account(name: "晚餐", money: 100, categories: 0, week: 1))
    }
}
