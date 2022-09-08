//
//  BaseService.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation
import Alamofire

class BaseService {
    var sessionManager: Session?

    init() {
        let configuration = URLSessionConfiguration.af.default
        configuration.timeoutIntervalForRequest = 15
        configuration.timeoutIntervalForRequest = 15
        sessionManager = Session(configuration: configuration)
    }

    func sendRequest<T: Decodable>(endPoint: String,
                                   parameters: [String: Any]?,
                                   method: HTTPMethod,
                                   encoding: ParameterEncoding,
                                   model: T.Type?,
                                   completion: @escaping (Result<T, String>) -> Void ) {

        let url = app.service.baseUrl + endPoint
        guard let dataRequest = sessionManager?.request(url,
                                                        method: method,
                                                        parameters: parameters,
                                                        encoding: encoding) else { return }

        dataRequest.downloadProgress { progress in
            DispatchQueue.main.async {
                print("[Dowloaded: \(progress.completedUnitCount)|\(progress.totalUnitCount) - %\(progress.fractionCompleted * 100)]")
            }
        }
        dataRequest.response { response in
            print(dataRequest.request?.url)
            if let statusCode = response.response?.statusCode {
                switch statusCode {
                case 200:
                    switch response.result {
                    case .success(let data):
                        guard let data = data else { return }
                        guard let model = data.getResponseModel(model: T.self) else { return }
                        completion(.success(model))
                    case .failure(let error):
                        completion(.error(ErrorMessages.handleNetworkResponse(error.responseCode ?? 0)))
                    }
                default:
                    completion(.error(ErrorMessages.handleNetworkResponse(statusCode)))
                }
            }

        }
    }
}
