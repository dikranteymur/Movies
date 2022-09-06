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
    func selectMovie(at index: Int)
}

enum MainScreenViewModelOutput {
    case hideNavigationTitle
    case updateBackButtonTitle(String)
    case setLoading(Bool)
}

enum MainScreenViewModelRoute {
    case detail(DetailScreenViewModelProtocol)
}

protocol MainScreenViewModelDelegate: AnyObject {
    func handleOutput(_ output: MainScreenViewModelOutput)
    func navigate(to route: MainScreenViewModelRoute)
}
