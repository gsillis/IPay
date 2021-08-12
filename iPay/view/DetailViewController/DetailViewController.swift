//
//  DetailViewController.swift
//  iPay
//
//  Created by Gabriela Sillis on 10/08/21.
//

import UIKit

class DetailViewController: UIViewController {

    var value: TotalValue?

    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var payBillButton: UIButton!

    private var controller: DetailController = DetailController()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self

    }
    @IBAction func payBillButtonTapped(_ sender: Any) {
    }

    private func setupPriceLabel() {
      
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return value?.productList.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell: DetailTableViewCell? = detailTableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell
        customCell?.setupCell(value: value?.productList[indexPath.row])
        return customCell ?? UITableViewCell()
    }
}
