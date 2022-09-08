//
//  Extension+UILabel.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

extension UIColor {
    private enum TMColors: String {
        case darkGray = "Dark Gray"
        case lightGray = "Light Gray"
        case systemBlue = "System Blue"
        case textBlack = "Text Black"
        case textGray = "Text Gray"
        case white = "White"
        case yellow = "Yellow"
    }

    class var tmDarkGray: UIColor {
        return UIColor(named: TMColors.darkGray.rawValue)
        ?? .darkGray
    }

    class var tmLightGray: UIColor {
        return UIColor(named: TMColors.lightGray.rawValue)
        ?? .lightGray
    }

    class var tmSystemBlue: UIColor {
        return UIColor(named: TMColors.systemBlue.rawValue)
        ?? .systemBlue
    }

    class var tmTextBlack: UIColor {
        return UIColor(named: TMColors.textBlack.rawValue)
        ?? .black
    }

    class var tmTextGray: UIColor {
        return UIColor(named: TMColors.textGray.rawValue)
        ?? .gray
    }

    class var tmWhite: UIColor {
        return UIColor(named: TMColors.white.rawValue)
        ?? .white
    }

    class var tmYellow: UIColor {
        return UIColor(named: TMColors.yellow.rawValue)
        ?? .yellow
    }
}
