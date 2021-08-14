//
//  DetailTableViewCell.swift
//  iPay
//
//  Created by Gabriela Sillis on 10/08/21.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setupCell(value: Product?) {
        if let data = value {
            self.priceLabel.text = String(format: " R$ %.2f", data.price)
            self.productNameLabel.text = data.name
            self.quantityLabel.text = String(data.quantity)
            self.productImage.image = UIImage(named: data.productType)
        }
    }

    func setupCell(value: HistoryAccount?) {
        if let data = value {
            self.productImage.image = UIImage(named: data.iconImage)
            self.priceLabel.text = String(format: " R$ %.2f", data.price)
            self.productNameLabel.text = data.name
        }
    }
}
