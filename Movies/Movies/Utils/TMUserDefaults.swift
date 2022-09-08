//
//  TMUserDefaults.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

enum TMUserDefaultsKeys: String {
    case guestSessionId
    case isLogin
}

final class TMUserDefaults {
    static var standart = UserDefaults.standard

    static func getSessionId(for key: TMUserDefaultsKeys) -> String? {
        guard let value = TMUserDefaults.standart.value(forKey: key.rawValue) as? String else { return nil }
        return value
    }

    static func setSessionId(for key: TMUserDefaultsKeys, newValue: String?) {
        guard let newValue = newValue else {
            standart.set(nil, forKey: key.rawValue)
            return
        }
        standart.set(newValue, forKey: key.rawValue)

    }

}
