//
//  TMError.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

struct TMErrorModel: Decodable {
    var success: Bool
    var statusCode: Int
    var statusMessage: String

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case statusCode = "status_code"
        case statusMessage = "status_message"
    }
}


//enum TMError {
//    case
//}
