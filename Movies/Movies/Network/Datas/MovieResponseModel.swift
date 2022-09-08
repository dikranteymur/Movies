//
//  MovieResponseModel.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

struct MovieResponseModel: Decodable {
    var dates: MovieDate?
    var page: Int?
    var results: [MovieResult]?
    var total_pages: Int?
    var total_results: Int?
}

struct MovieDate: Decodable {
    var maximum: String?
    var minimum: String?
}

struct MovieResult: Decodable {
    var adult: Bool?
    var backdrop_path: String?       // "/ugS5FVfCI3RV0ZwZtBV3HAV75OX.jpg"
    var genre_ids: [Int]?
    var id: Int?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity: Double?             // "popularity": 9865.569
    var poster_path: String?          // "/rugyJdeoJm7cSJL1q4jBpTNbxyU.jpg"
    var release_date: String?           // "2022-06-11"
    var title: String?
    var video: Bool?
    var vote_average: Double?
    var vote_count: Int?
}
