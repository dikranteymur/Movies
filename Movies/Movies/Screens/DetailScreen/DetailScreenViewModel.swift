//
//  DetailScreenViewModel.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

final class DetailScreenViewModel: DetailScreenViewModelProtocol {
    weak var delegate: DetailScreenViewModelDelegate?
    var model: MovieDetailResonseModel?

    init(model: MovieDetailResonseModel) {
        self.model = model
    }

    func load() {
        guard let title = model?.title else { return }
        if let year = model?.release_date?.split(separator: "-").first {
            let formattedTitle = title + "(\(year))"
            notify(.updateTitle(formattedTitle))
        } else {
            notify(.updateTitle(title))
        }
    }

    func showDetail() {
        guard let model = model else { return }
        notify(.showDetail(model: model))
    }

    private func notify(_ handleOutput: DetailScreenViewModeOutput) {
        delegate?.handleOutput(handleOutput)
    }
}
