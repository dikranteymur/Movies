//
//  BaseRequestModel.swift
//  Movies
//
//  Created by Dikran Teymur on 8.09.2022.
//

import Foundation
import Alamofire

class BaseRequestModel {
    var endPoint: String
    var method: HTTPMethod
    var body: Encodable?
    var encoding: ParameterEncoding

    init(endPoint: String, method: HTTPMethod, body: Encodable?, encoding: ParameterEncoding) {
        self.endPoint = endPoint
        self.method = method
        self.body = body
        self.encoding = encoding
    }
}
