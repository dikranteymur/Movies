//
//  Extension+UIFont.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

extension UIFont {
    enum TMFonts: String {
        case medium = "SF-Pro-Text-Medium"
        case regular = "SF-Pro-Text-Regular"
        case bold = "SF-Pro-Text-Bold"
    }

    class var medium12: UIFont {
        return UIFont(name: TMFonts.medium.rawValue, size: 12)
        ?? UIFont.systemFont(ofSize: 12)
    }

    class var medium13: UIFont {
        return UIFont(name: TMFonts.medium.rawValue, size: 13)
        ?? UIFont.systemFont(ofSize: 13)
    }

    class var regular15: UIFont {
        return UIFont(name: TMFonts.regular.rawValue, size: 15)
        ?? UIFont.systemFont(ofSize: 15)
    }

    class var bold15: UIFont {
        return UIFont(name: TMFonts.bold.rawValue, size: 15)
        ?? UIFont.systemFont(ofSize: 15)
    }

    class var regular17: UIFont {
        return UIFont(name: TMFonts.regular.rawValue, size: 17)
        ?? UIFont.systemFont(ofSize: 17)
    }

    class var bold20: UIFont {
        return UIFont(name: TMFonts.bold.rawValue, size: 20)
        ?? UIFont.systemFont(ofSize: 20)
    }
}
