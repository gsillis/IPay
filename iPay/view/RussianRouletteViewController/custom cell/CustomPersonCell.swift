//
//  CustomPersonCell.swift
//  iPay
//
//  Created by Gabriela Sillis on 09/08/21.
//

import UIKit

class CustomPersonCell: UITableViewCell {
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var pessoaImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupCell(person: Person?) {
        if let inputValue = person {
            self.nomeLabel.text = inputValue.name
            self.pessoaImage.image = UIImage(named: inputValue.image)
        }
    }
}
