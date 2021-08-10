//
//  FetchTotalValue.swift
//  iPay
//
//  Created by Gabriela Sillis on 10/08/21.
//

import Foundation


class FetchTotalValue {

    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonDecoder = try? decoder.decode(TotalValue.self, from: json) {

            print(jsonDecoder)
        }
    }
}
