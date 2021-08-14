//
//  ImagePicker.swift
//  iPay
//
//  Created by Gabriela Sillis on 13/08/21.
//

import UIKit

protocol ImagePickerProtocol: AnyObject {
    func imagePicker(photo: UIImage)
}

class ImagePicker: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let vc = UIImagePickerController()
    let view = UIViewController()

    func imagePicker() {
        vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
    
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            print(image.size)
        } else {
            print("não foi possivel salvar imagem")
        }
    }
}
