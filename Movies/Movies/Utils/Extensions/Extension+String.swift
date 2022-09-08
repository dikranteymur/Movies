//
//  Extension+String.swift
//  Movies
//
//  Created by Dikran Teymur on 8.09.2022.
//

import Foundation

extension String {
    func addQueryString(params: [String: Any]) -> String {
        var queryString: String = self
        for (key, value) in params {
            guard let value = value as? String else { return "" }
            queryString += "?" + key + "=" + value
        }
        return queryString
    }

    var toDateFormat: String {
        get {
            let split = self.split(separator: "-")
            let new = split.reversed()
            return new.joined(separator: ".")
        }
    }
}
