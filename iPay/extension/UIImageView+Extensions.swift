//
//  UIImageView+Extensions.swift
//  iPay
//
//  Created by Gabriela Sillis on 09/08/21.
//

import UIKit

extension UIImageView {

    func circleBorder() {
        layer.cornerRadius = 0.5*layer.bounds.size.width
        clipsToBounds = true
    }
}
