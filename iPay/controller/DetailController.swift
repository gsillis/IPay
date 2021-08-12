//
//  DetailController.swift
//  iPay
//
//  Created by Gabriela Sillis on 11/08/21.
//

import Foundation

class DetailController {

    var value: TotalValue?

    init(value: TotalValue?) {
        self.value = value
    }

    var count: Int {
        guard let data = value?.productList else { return  1}
        return data.count
    }

    func loadProduct(indexPath: IndexPath) -> Product? {
        return value?.productList[indexPath.row]
    }
}
