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

    private var controller: RussianRouletteController = RussianRouletteController()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.lisTableView.delegate = self
        self.lisTableView.dataSource = self
        self.lisTableView.register(UINib(nibName: "CustomPersonCell", bundle: nil), forCellReuseIdentifier: "CustomPersonCell")
        self.lisTableView.register(UINib(nibName: "EmptyCell", bundle: nil), forCellReuseIdentifier: "EmptyCell")
        self.lisTableView.tableFooterView = UIView()
        self.nameTextfield.delegate = self

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
            return cellNomes ?? UITableViewCell()
        }
    }
}


extension RussianRouletteViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.controller.addPerson(name: textField.text)
        textField.text = nil
        self.lisTableView.reloadData()
        return true
    }
}
