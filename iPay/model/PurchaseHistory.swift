//
//  PurchaseHistory.swift
//  iPay
//
//  Created by Gabriela Sillis on 14/08/21.
//

import Foundation

//{
//  "totalValue": 3566.10,
//  "historyAccountList": [
//    {
//      "historyID": "9a157e36-7279-41d0-9d30-5310e9afd6321",
//      "date": "2020-11-24T00:00:00.000",
//      "name": "Bar da Mooca",
//      "price": 250.10,
//      "iconImage": "url-image-mooca"
//    },

struct PurchaseHistory: Codable {
    let totalValue: Double
    let historyAccountList: [HistoryAccount]
}

struct HistoryAccount: Codable {
    let historyID, date, name, iconImage: String
    let price: Double
}

extension PurchaseHistory {
    init(data: Data) throws {
        self = try JSONDecoder().decode(PurchaseHistory.self, from: data)
    }
}
