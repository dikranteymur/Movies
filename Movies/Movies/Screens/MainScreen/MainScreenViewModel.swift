//
//  MainScreenViewModel.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import Foundation

final class MainScreenViewModel: MainScreenViewModelProtocol {
    weak var delegate: MainScreenViewModelDelegate?

    let service: AppService?

    init(service: AppService) {
        self.service = service
    }

    func load() {
        notify(.hideNavigationTitle)
        notify(.updateBackButtonTitle(""))

        service?.getNowPlayingMovies(page: 1, completion: { response in
            guard let results = response.results else { return }
            self.notify(.showNowPlayingMovieList(results))
        })

        service?.getUpComingMovies(completion: { response in
            guard let results = response.results else { return }
            self.notify(.showUpComingMovieList(results))
        })
    }

    func fetchMovies(page: Int) {
        service?.getNowPlayingMovies(page: page, completion: { response in
            guard let results = response.results else { return }
            self.notify(.showNowPlayingMovieList(results))
            print("\(page).sayfa yuklendi")
        })
    }

    func fetchMovieDetail(id: Int) {
        service?.getMovieDetail(id: id, completion: { model in
            let viewModel = DetailScreenViewModel(model: model)
            self.delegate?.navigate(to: .detail(viewModel))

        })
    }

    func selectedMovie(at index: Int) {

    }


    private func notify(_ output: MainScreenViewModelOutput) {
        delegate?.handleOutput(output)
    }


    
}
