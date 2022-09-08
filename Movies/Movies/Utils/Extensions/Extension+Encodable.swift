//
//  Extension+Encodable.swift
//  Movies
//
//  Created by Dikran Teymur on 8.09.2022.
//

import Foundation

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        let jsonObject = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
        return jsonObject.flatMap({ $0 as? [String: Any]})
    }
}
