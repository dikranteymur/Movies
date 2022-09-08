//
//  Result.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation
import Alamofire

enum Result<Value, ErrorMessages> {
    case success(Value)
    case error(String)
}

enum ErrorMessages: String {
    case success
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."

    static func handleNetworkResponse(_ response: Int) -> String {
        switch response {
        case 200...299: return "success"
        case 401...500: return ErrorMessages.authenticationError.rawValue
        case 501...599: return ErrorMessages.badRequest.rawValue
        case 600:       return ErrorMessages.outdated.rawValue
        default:        return ErrorMessages.failed.rawValue
        }
    }

}

//private enum NetworkResponse: String {
//    case success
//    case authenticationError = "You need to be authenticated first."
//    case badRequest = "Bad request"
//    case outdated = "The url you requested is outdated."
//    case failed = "Network request failed."
//    case noData = "Response returned with no data to decode."
//    case unableToDecode = "We could not decode the response."
//}
//
//private func handleNetworkResponse(_ response: HTTPURLResponse) -> String {
//    switch response.statusCode {
//    case 200...299: return "success"
//    case 401...500: return NetworkResponse.authenticationError.rawValue
//    case 501...599: return NetworkResponse.badRequest.rawValue
//    case 600:       return NetworkResponse.outdated.rawValue
//    default:        return NetworkResponse.failed.rawValue
//    }
//}
