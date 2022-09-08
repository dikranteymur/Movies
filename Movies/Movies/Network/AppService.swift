//
//  AppService.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation
import Alamofire

final class AppService: BaseService {
    func getGuestSessionId(completion: @escaping () -> Void) {
        let params = ["api_key": app.service.apiKey]
        let endPoint = EndPoints.guestSession.getEndPoint
        sendRequest(endPoint: endPoint,
                    parameters: params,
                    method: .get,
                    encoding: URLEncoding.queryString,
                    model: SessionIdResponseModel.self) { response in
            switch response {
            case .success(let model):
                guard let guestSessionId = model.guestSessionId else { return }
                TMUserDefaults.setSessionId(for: .guestSessionId, newValue: guestSessionId)
                completion()
            case .error(let error):
                TMUserDefaults.setSessionId(for: .guestSessionId, newValue: nil)
                print(error)
            }
        }
    }

    func getUpComingMovies(page: Int, completion: @escaping (MovieResponseModel) -> Void) {
        let params = ["api_key": app.service.apiKey,
                      "page": page] as [String : Any]
        let endPoint = EndPoints.upComing.getEndPoint
        sendRequest(endPoint: endPoint,
                    parameters: params,
                    method: .get,
                    encoding: URLEncoding.default,
                    model: MovieResponseModel.self) { response in
            switch response {
            case .success(let model):
                completion(model)
            case .error(let error):
                print(error)
            }
        }
    }

    func getNowPlayingMovies(page: Int, completion: @escaping (MovieResponseModel) -> Void) {
        let params: [String: Any] = ["api_key": app.service.apiKey,
                                     "language": "en-US",
                                     "page": page]
        let endPoint = EndPoints.nowPlaying.getEndPoint
        sendRequest(endPoint: endPoint,
                    parameters: params,
                    method: .get,
                    encoding: URLEncoding.default,
                    model: MovieResponseModel.self) { response in
            switch response {
            case .success(let model):
                completion(model)
            case .error(let error):
                print(error)
            }
        }
    }

    func getUpComingMovies(completion: @escaping (MovieResponseModel) -> Void) {
        let params: [String: Any] = ["api_key": app.service.apiKey,
                                     "language": "en-US"]
        let endPoint = EndPoints.upComing.getEndPoint
        sendRequest(endPoint: endPoint,
                    parameters: params,
                    method: .get,
                    encoding: URLEncoding.default,
                    model: MovieResponseModel.self) { response in
            switch response {
            case .success(let model):
                completion(model)
            case .error(let error):
                print(error)
            }
        }
    }

    func getMovieDetail(id: Int, completion: @escaping (MovieDetailResonseModel) -> Void) {
        let params: [String: Any] = ["api_key": app.service.apiKey, "language": "en-US"]
        let endPoint = String(format: EndPoints.movieDetail.getEndPoint, String(id))
        sendRequest(endPoint: endPoint,
                    parameters: params,
                    method: .get,
                    encoding: URLEncoding.default,
                    model: MovieDetailResonseModel.self) { response in
            switch response {
            case .success(let model):
                completion(model)
            case .error(let error):
                print(error)
            }
        }
    }
}

extension AppService {
    var baseUrl: String {
        return "https://api.themoviedb.org/3/"
    }

    var apiKey: String {
        return "22debb08dbc492db427c9fa8c80359c2"
    }

    var imageBaseUrl: String {
        return "https://image.tmdb.org/t/p/w500"
    }
}

