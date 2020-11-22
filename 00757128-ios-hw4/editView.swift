//
//  mainView.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/21.
//

import SwiftUI

struct editView: View {
    @Environment(\.presentationMode) var presentationMode
    var editAccountIndex: Int?
    var accountsData: accountData
    @State private var name = "Dinner"
    @State private var money = 80
    @State private var categories = 0
    @State private var week = 1
    @State private var isDone = false
    
    var body: some View {
        Form {
            TextField("項目名稱", text: $name)
            Stepper("金額 \(money)", value: $money, in: 1...1000)
            Picker(selection: $categories, label: Text("選擇類別")) {
                ForEach(cate.indices) { (index) in
                        Text(cate[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Stepper("星期 \(week)", value: $week, in: 1...7)
            Toggle(isOn: $isDone)
            {
                Text("確認資料都正確嗎？")
            }
        }
        .onAppear(perform: {
            if let editAccountIndex = editAccountIndex {
                let editAccount = accountsData.accounts[editAccountIndex]
                name = editAccount.name
                money = editAccount.money
                categories = editAccount.categories
                week = editAccount.week
            }
        })
        .navigationBarTitle(editAccountIndex == nil ? "新增帳目" : "修改帳目")
        .toolbar(content: {
            ToolbarItem {
                Button("Save") {
                    let Account = account(name: name, money: money, categories: categories, week: week)
                    if let editAccountIndex = editAccountIndex {
                        accountsData.accounts[editAccountIndex] = Account
                    } else {
                        accountsData.accounts.insert(Account, at: 0)
                        
                    }
                    presentationMode.wrappedValue.dismiss()
                }
                .disabled(!isDone)
            }
        })
        
    }
}

/*struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}*/
