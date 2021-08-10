//
//  UIView+Extensions.swift
//  iPay
//
//  Created by Gabriela Sillis on 09/08/21.
//

import UIKit

extension UIView {

    func cornerRadius() {
        layer.cornerRadius = 8
        clipsToBounds = true
    }
}
