//
//  TotalValue.swift
//  iPay
//
//  Created by Gabriela Sillis on 10/08/21.
//

import Foundation


//{
//  "totalValue": 480.0,
//  "productList": [
//    {
//      "productID": "9a157e36-7279-41d0-9d30-5310e9afd6324",
//      "productType": "REFEIÇÃO",
//      "date": "2020-11-24T00:00:00.000",
//      "name": "Fritas",
//      "price": 45.7,
//      "quantity": 2
//    },


struct TotalValue: Decodable {
    let totalValue: Double
    let productList: [Product]
}

struct Product: Decodable {
    let productID: String
    let productType: String
    let name: String
    let price: Double
    let quantity: Int
}

//extension TotalValue {
//    init(data: Data) throws {
//        self = try JSONDecoder().decode(TotalValue.self, from: data)
//    }
//}
