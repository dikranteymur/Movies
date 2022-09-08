//
//  MovieDetailResponseModel.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

struct MovieDetailResonseModel: Decodable {
    var backdrop_path: String?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var title: String?
    var vote_average: Double?
}
