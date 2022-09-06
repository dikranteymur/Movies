//
//  MainScreenViewModel.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

final class MainScreenViewModel: MainScreenViewModelProtocol {
    weak var delegate: MainScreenViewModelDelegate?

    func load() {
        notify(.hideNavigationTitle)
        notify(.updateBackButtonTitle(""))
    }

    func selectMovie(at index: Int) {

    }

    private func notify(_ output: MainScreenViewModelOutput) {
        delegate?.handleOutput(output)
    }


    
}
