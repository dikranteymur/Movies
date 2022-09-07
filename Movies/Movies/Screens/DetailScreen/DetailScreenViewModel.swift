//
//  DetailScreenViewModel.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

final class DetailScreenViewModel: DetailScreenViewModelProtocol {
    weak var delegate: DetailScreenViewModelDelegate?
    var model: [String] = []

    func load() {
        notify(.updateTitle("Detail Screen"))
    }

    private func notify(_ handleOutput: DetailScreenViewModeOutput) {
        delegate?.handleOutput(handleOutput)
    }
}
