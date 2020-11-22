//
//  accountList.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/21.
//

import SwiftUI

struct accountList: View {
    @ObservedObject var accountsData = accountData()
    @State private var showEdit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(accountsData.accounts.indices, id: \.self) { (index) in
                    
                    NavigationLink(
                        destination: editView(editAccountIndex: index, accountsData: accountsData),
                        label: {
                            accountRow(anAccount: accountsData.accounts[index])
                        })
                }
                .onMove { (indexSet, index) in
                    accountsData.accounts.move(fromOffsets: indexSet,
                                      toOffset: index)
                }
                .onDelete(perform: { indexSet in
                    accountsData.accounts.remove(atOffsets: indexSet)
                })
            }
            .navigationTitle("記帳列表")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showEdit = true
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                        
                    })
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            })
            .sheet(isPresented: $showEdit, content: {
                NavigationView {
                    editView(accountsData: accountsData)
                }
            })
        }
    }
}

struct accountList_Previews: PreviewProvider {
    static var previews: some View {
        accountList()
    }
}
