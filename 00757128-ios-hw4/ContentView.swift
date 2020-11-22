//
//  ContentView.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var accountsData = accountData()
    
    var body: some View {
        TabView {
            accountList(accountsData: self.accountsData)
                .tabItem {
                    Image(systemName: "music.house.fill")
                    Text("記帳")
                }
            chart(Accounts: self.accountsData)
                .tabItem {
                    Image(systemName: "music.house.fill")
                    Text("支出統計")
                }
            chartBalance(Accounts: self.accountsData)
                .tabItem {
                    Image(systemName: "music.house.fill")
                    Text("收支統計")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
