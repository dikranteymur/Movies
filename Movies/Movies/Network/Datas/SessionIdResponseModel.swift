//
//  SessionIdResponseModel.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

struct SessionIdResponseModel: Decodable {
    var success: Bool?
    var guestSessionId: String?
    var expiresAt: String?

    enum CodingKeys: String, CodingKey {
        case success = "success"
        case guestSessionId = "guest_session_id"
        case expiresAt = "expires_at"
    }
}

//"success": true,
//"guest_session_id": "820934001f5f78ec8c6fd8efd240f61a",
//"expires_at": "2022-09-09 10:19:59 UTC"
