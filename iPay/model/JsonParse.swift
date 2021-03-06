//
//  JsonParse.swift
//  iPay
//
//  Created by Gabriela Sillis on 17/08/21.
//

import Foundation

struct JsonParse {

    func jsonParse<T: Decodable>(data: T.Type, for resource: String) -> T? {
        do {
            if let path = Bundle.main.path(forResource: resource, ofType: "json") {
                let data: Data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decodeData: T = try JSONDecoder().decode(T.self, from: data)
                return decodeData
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}
