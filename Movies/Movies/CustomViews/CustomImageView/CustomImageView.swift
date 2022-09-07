//
//  Extension+UIImageView.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import UIKit

@IBDesignable
class CustomImageView: UIImageView {
    @IBInspectable var grFirstColor: UIColor = .white
    @IBInspectable var grLastColor: UIColor = .white
    @IBInspectable var alphaValue: CGFloat = 0.0

    @IBInspectable var cornerRadiusValue: CGFloat {
        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            clipsToBounds = true
        }
    }

    @IBInspectable var makeOval: Bool {
        get {
            return false
        }

        set {
            if newValue {
                layer.cornerRadius = bounds.width / 2
            } else {
                layer.cornerRadius = cornerRadiusValue
            }
        }
    }


    @IBInspectable var linearGradient: CGFloat {
        get {
            return 0
        }
        set {
            addGradientLayer(degree: newValue)
        }

    }

    private func addGradientLayer(degree: CGFloat) {
        let gradientLayer = CAGradientLayer()
        let alpaValue = CGFloat(alphaValue / 100)
        let firstColor = grFirstColor.withAlphaComponent(alpaValue).cgColor
        let lastColor = grLastColor.withAlphaComponent(alpaValue).cgColor
        gradientLayer.colors = [firstColor, lastColor]
        gradientLayer.calculatePoints(for: degree)
        layer.addSublayer(gradientLayer)
        gradientLayer.frame = bounds
    }
}
