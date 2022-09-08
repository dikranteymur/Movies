//
//  MainScreenContracts.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

protocol MainScreenViewModelProtocol {
    var delegate: MainScreenViewModelDelegate? { get set }
    func load()
    func fetchMovies(page: Int)
    func fetchMovieDetail(id: Int)
    func selectedMovie(at index: Int)

}

enum MainScreenViewModelOutput {
    case hideNavigationTitle
    case showNavigationTitle
    case updateBackButtonTitle(String)
    case setLoading(Bool)
    case showNowPlayingMovieList([MovieResult])
    case showUpComingMovieList([MovieResult])
}

enum MainScreenViewModelRoute {
    case detail(DetailScreenViewModelProtocol)
}

protocol MainScreenViewModelDelegate: AnyObject {
    func handleOutput(_ output: MainScreenViewModelOutput)
    func navigate(to route: MainScreenViewModelRoute)
}
