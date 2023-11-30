//
//  Extension.swift
//  LittleLemonApp
//
//  Created by Caner Karabulut on 23.10.2023.
//

import UIKit

extension UIViewController {
    func backgroundGradientColor() {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.white.cgColor, UIColor.white.cgColor.alpha]
        gradient.locations = [0,1]
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
    }
}

