//
//  DetailViewController.swift
//  iPay
//
//  Created by Gabriela Sillis on 10/08/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var payBillButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.detailTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self

    }
    @IBAction func payBillButtonTapped(_ sender: Any) {
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell: DetailTableViewCell? = detailTableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell

        return customCell ?? UITableViewCell()
    }


}
