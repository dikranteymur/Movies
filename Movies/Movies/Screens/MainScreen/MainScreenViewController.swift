//
//  MainScreenViewController.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

final class MainScreenViewController: BaseScreenViewController {
    @IBOutlet private weak var sliderCollectionView: UICollectionView!
    @IBOutlet private weak var moviesTableView: UITableView!

    var tableViewAdapter: MoviesTableViewAdapter?
    var upComingDataSource: [MovieResult] = []
    var currentPage:Int = 1
    
    var viewModel: MainScreenViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sliderCollectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        tableViewAdapter = MoviesTableViewAdapter(tableView: moviesTableView, delegate: self)
        viewModel?.load()
    }
}

extension MainScreenViewController: MainScreenViewModelDelegate {
    func handleOutput(_ output: MainScreenViewModelOutput) {
        switch output {
        case .hideNavigationTitle:
            navigationController?.navigationBar.isHidden = true
        case .updateBackButtonTitle(let title):
            navigationItem.backButtonTitle = title
        case .setLoading(let isLoading):
            print(isLoading)
        case .showNowPlayingMovieList(let movies):
            tableViewAdapter?.dataSource.append(contentsOf: movies)
            tableViewAdapter?.reloadTableView()
        case .showUpComingMovieList(let movies):
            upComingDataSource = movies
            sliderCollectionView.reloadData()
        case .showNavigationTitle:
            navigationController?.navigationBar.isHidden = false
        }
    }

    func navigate(to route: MainScreenViewModelRoute) {
        switch route {
        case .detail(let viewModel):
            
            let viewController = DetailScreenBuilder.make(viewModel: viewModel)
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

extension MainScreenViewController: MoviesTableViewAdapterDelegate {
    func getNewMovies(page: Int) {
        viewModel?.fetchMovies(page: page)
    }

    func selectedMovie(at index: Int) {
        guard let movieId = tableViewAdapter?.dataSource[index].id else { return }
        viewModel?.fetchMovieDetail(id: movieId)
    }
}

extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return upComingDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as? CollectionViewCell else { fatalError() }
        cell.setCell(model: upComingDataSource[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width
        let height = collectionView.frame.height
        return CGSize(width: width, height: height)
    }
}
