//
//  Alert.swift
//  iPay
//
//  Created by Gabriela Sillis on 10/08/21.
//

import PopupDialog
import UIKit


extension UIViewController {
    func showAlert(_ title: String, _ message: String, _ image: UIImage, completion: @escaping () -> Void) {
        let title = title
        let message = message
        let image = image

        let popup: PopupDialog = PopupDialog(title: title, message: message, image: image)
        let confirmButton: PopupDialogButton = PopupDialogButton(title: "OK") {
            completion()
        }

        popup.addButton(confirmButton)
        self.present(popup, animated: true)
        self.layoutAlert()
    }

    func layoutAlert() {
        let layout: PopupDialogDefaultView = PopupDialogDefaultView.appearance()
        layout.backgroundColor = .black
        layout.titleFont = .systemFont(ofSize: 20)
        layout.messageFont = .systemFont(ofSize: 18)
    }
}
