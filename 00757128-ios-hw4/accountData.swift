//
//  accountData.swift
//  00757128-ios-hw4
//
//  Created by User18 on 2020/11/21.
//

import Foundation
import SwiftUI

class accountData: ObservableObject {
    @AppStorage("account") var accountsData: Data?
    
    init() {
        if let accountsData = accountsData {
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([account].self,
                                                     from: accountsData) {
                accounts = decodedData
            }
        }
    }
    
    @Published var accounts = [account]() {
        didSet {
            let encoder = JSONEncoder()
            do {
                let data = try encoder.encode(accounts)
                accountsData = data
            } catch {
            }
        }
    }
}
