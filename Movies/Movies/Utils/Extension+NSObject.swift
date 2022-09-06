//
//  Extension+NSObject.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
}
