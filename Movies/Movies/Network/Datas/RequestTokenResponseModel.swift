//
//  RequestTokenResponseModel.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

struct RequestTokenResponseModel: Decodable {
    var success: Bool?
    var expiresAt: String?
    var requestToken: String?

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case expiresAt = "expires_at"
        case requestToken = "request_token"
    }
}
