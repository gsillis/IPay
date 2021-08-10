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

    private var controller: RussianRouletteController = RussianRouletteController()

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
    }

    @IBAction func sortButtonTapped(_ sender: Any) {
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

    }
}

// MARK: - extension UITextFieldDelegate
extension RussianRouletteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.hasText {
            self.controller.addPerson(name: textField.text)
        }
        self.lisTableView.reloadData()
        self.view.endEditing(true)
        return true
    }
}
