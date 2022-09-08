//
//  Extension+String.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

extension Date {
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.mm.yyyy"
        return formatter.string(from: self)
    }
}
