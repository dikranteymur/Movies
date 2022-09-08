//
//  Extension+Double.swift
//  Movies
//
//  Created by Dikran Teymur on 8.09.2022.
//

import Foundation

extension Double {
    func setFormatted(fractionDigit: Int) -> String {
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = fractionDigit
        guard let formattedNumber = formatter.string(from: NSNumber(value: self)) else { return ""}
        return formattedNumber
    }
}
