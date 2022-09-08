//
//  EndPoints.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import Foundation

enum EndPoints: String {
    case guestSession, movieDetail, upComing, nowPlaying

    var getEndPoint: String {
        switch self {
        case .guestSession: return "authentication/guest_session/new"
        case .movieDetail:  return "movie/%@"
        case .upComing:     return "movie/upcoming"
        case .nowPlaying:   return "movie/now_playing"

        }
    }
}

//authentication/token/new
//authentication/session/new
//movie/{movie_id}
//movie/upcoming
//movie/now_playing
