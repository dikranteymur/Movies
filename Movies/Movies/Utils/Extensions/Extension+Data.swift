//
//  Extension+Data.swift
//  Movies
//
//  Created by Dikran Teymur on 8.09.2022.
//

import Foundation

extension Data {
    func getResponseModel<T: Decodable>(model: T.Type) -> T? {
        guard let model = try? JSONDecoder().decode(model.self, from: self) else { return nil }
        return model
    }
}
