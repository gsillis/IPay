//
//  RussianRouletteController.swift
//  iPay
//
//  Created by Gabriela Sillis on 09/08/21.
//

import Foundation

protocol RussianRouletteDelegate: AnyObject {
    func showWinner()
    func removeUser()
}

class RussianRouletteController {
    private var arrayImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    private var arrayPessoa: [Person] = []
    private var winner: Person?
    weak var delegate: RussianRouletteDelegate?

    func addPerson(name: String?) {
        self.arrayPessoa.append(Person(name: name ?? "", image: arrayImage.randomElement() ?? ""))
    }

    func arrayCount() -> Int {
        if arrayPessoa.isEmpty {
            return 1
        }
        return arrayPessoa.count
    }

    func checkEmptyState() -> Bool {
        return arrayPessoa.isEmpty
    }

    func loadCurrentUser(indexPath: IndexPath) -> Person {
        return self.arrayPessoa[indexPath.row]
    }

    func lockButton() -> Bool {
        return arrayPessoa.count > 1
    }

    func randomWinner() {
        self.winner = self.arrayPessoa.randomElement()
    }

    func showWinner(indexPath: IndexPath) {
        if self.winner === self.arrayPessoa[indexPath.row] {
            self.delegate?.showWinner()
        } else {
            self.arrayPessoa.remove(at: indexPath.row)
            self.delegate?.removeUser()
        }
    }

    func jsonParse() -> TotalValue? {
    let json: JsonParse = JsonParse()
      return json.jsonParse(data: TotalValue.self, for: "JSONData")
    }
}
