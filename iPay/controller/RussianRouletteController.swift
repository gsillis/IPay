//
//  RussianRouletteController.swift
//  iPay
//
//  Created by Gabriela Sillis on 09/08/21.
//

import Foundation

class RussianRouletteController {
    private var arrayImage: [String] = ["Image-1", "Image-2", "Image-3", "Image-4", "Image-5"]
    private var arrayPessoa: [Person] = []
    private var winner: Person?

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

    func showWinner(indexPath: IndexPath) -> Bool {
        if self.winner === self.arrayPessoa[indexPath.row] {
            return true
        } else {
            self.arrayPessoa.remove(at: indexPath.row)
        }
        return false
    }
}
