//
//  RussianRouletteViewController.swift
//  iPay
//
//  Created by Gabriela Sillis on 03/08/21.
//

import UIKit

class RussianRouletteViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var lisTableView: UITableView!
    @IBOutlet weak var sortButton: UIButton!

    private let controller: RussianRouletteController = RussianRouletteController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lisTableView.delegate = self
        self.lisTableView.dataSource = self
        self.lisTableView.register(UINib(nibName: "CustomPersonCell", bundle: nil), forCellReuseIdentifier: "CustomPersonCell")
        self.lisTableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        self.lisTableView.tableFooterView = UIView()
        self.nameTextfield.delegate = self
        self.sortButton.cornerRadius()
        self.nameTextfield.cornerRadius()
        self.blockButton()
    }

    private  func blockButton() {
        if self.controller.lockButton() {
            self.sortButton.isUserInteractionEnabled = true
            self.sortButton.alpha = 1.0
        } else {
            self.sortButton.isUserInteractionEnabled = false
            self.sortButton.alpha = 0.5
        }
    }

    @IBAction func sortButtonTapped(_ sender: Any) {
        self.controller.randomWinner()
    }
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource
extension RussianRouletteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.arrayCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if controller.checkEmptyState() {
            let emptyCell: EmptyCell? = lisTableView.dequeueReusableCell(withIdentifier: "EmptyCell", for: indexPath) as? EmptyCell

            return emptyCell ?? UITableViewCell()
        } else {
            let cellNomes: CustomPersonCell? = lisTableView.dequeueReusableCell(withIdentifier: "CustomPersonCell", for: indexPath) as? CustomPersonCell
            cellNomes?.setupCell(person: self.controller.loadCurrentUser(indexPath: indexPath))
            return cellNomes ?? UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.controller.showWinner(indexPath: indexPath) {
            print("se lascou")
        } else {
            self.lisTableView.reloadData()
        }
    }
}

// MARK: - extension UITextFieldDelegate
extension RussianRouletteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.hasText {
            self.controller.addPerson(name: textField.text)
        }

        // limpa o texto do texfield
        textField.text = nil

        self.lisTableView.reloadData()
        self.blockButton()
        // dismiss no teclado ao clicar em return
        self.view.endEditing(true)
        return true
    }
}
