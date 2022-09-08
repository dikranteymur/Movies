//
//  DetailScreenContracts.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

protocol DetailScreenViewModelProtocol {
    var delegate: DetailScreenViewModelDelegate? { get set }
    func load()
    func showDetail()
}

enum DetailScreenViewModeOutput {
    case updateTitle(String)
    case setLoading(Bool)
    case showDetail(model: MovieDetailResonseModel)
}

protocol DetailScreenViewModelDelegate: AnyObject {
    func handleOutput(_ output: DetailScreenViewModeOutput)
}
