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

    var controller: DetailController?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailTableView.register(UINib(nibName: "DetailTableViewCell", bundle: nil), forCellReuseIdentifier: "DetailTableViewCell")
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
        self.setupPriceLabel()
    }
    @IBAction func payBillButtonTapped(_ sender: Any) {
        self.imagePicker()
    }

    private func imagePicker() {
        let vc: UIImagePickerController = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        self.present(vc, animated: true, completion: nil)
    }

    private func setupPriceLabel() {
        self.priceLabel.text = String(format: "R$ %.2f ", controller?.value?.totalValue ?? 0.0)
    }
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell: DetailTableViewCell? = detailTableView.dequeueReusableCell(withIdentifier: "DetailTableViewCell", for: indexPath) as? DetailTableViewCell
        customCell?.setupCell(value: controller?.loadProduct(indexPath: indexPath))
        return customCell ?? UITableViewCell()
    }
}

// MARK: - extension UIImagePickerControllerDelegate, UINavigationControllerDelegate
extension DetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        print(image.size)
        picker.dismiss(animated: true, completion: nil)
    }
}
