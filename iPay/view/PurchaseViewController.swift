//
//  PurchaseViewController.swift
//  iPay
//
//  Created by Gabriela Sillis on 14/08/21.
//

import UIKit

class PurchaseViewController: UIViewController {
    @IBOutlet weak var purchaseTableView: UITableView!

    private var dataHistory: PurchaseHistory?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.purchaseTableView.delegate = self
        self.purchaseTableView.dataSource = self
        self.purchaseTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: DetailTableViewCell.customCell)

    }

    // REFATORAR
    func jsonParse() -> PurchaseHistory? {
        do {
            if let path = Bundle.main.path(forResource: "Historico", ofType: "json") {
                let data: Data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let value: PurchaseHistory = try PurchaseHistory(data: data)
                self.dataHistory = value
               return dataHistory
            }
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension PurchaseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.jsonParse()?.historyAccountList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DetailTableViewCell? = purchaseTableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.customCell, for: indexPath) as? DetailTableViewCell
        cell?.setupCell(value: dataHistory?.historyAccountList[indexPath.row])
        
        return cell ?? UITableViewCell()
    }
}
