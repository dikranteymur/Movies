//
//  MoviesTableViewAdapter.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

protocol MoviesTableViewAdapterDelegate: AnyObject {
    func getNewMovies(page: Int)
    func selectedMovie(at index: Int)
}

final class MoviesTableViewAdapter: NSObject {
    private var tableView: UITableView!
    weak var delegate: MoviesTableViewAdapterDelegate?

    var dataSource: [MovieResult] = [] {
        didSet {
            self.reloadTableView()
        }
    }

    var page = 1

    init(tableView: UITableView, delegate: MoviesTableViewAdapterDelegate) {
        super.init()
        self.tableView = tableView
        self.delegate = delegate
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: MoviesTableViewCell.className, bundle: nil), forCellReuseIdentifier: MoviesTableViewCell.className)
    }

    func reloadTableView() {
        tableView.reloadData()
    }

    func scrollToTop() {
        tableView.scrollToRow(at: [0,0], at: .top, animated: true)
    }
}

extension MoviesTableViewAdapter: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MoviesTableViewCell  = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.className) as? MoviesTableViewCell else { fatalError("\(MoviesTableViewCell.className) not found")}
        cell.setCell(model: dataSource[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selectedMovie(at: indexPath.row)
        let cell = tableView.cellForRow(at: indexPath)
        cell?.isSelected = false
    }

    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if scrollView.contentOffset.y > scrollView.contentSize.height - scrollView.frame.size.height {
            page += 1
            delegate?.getNewMovies(page: page)

        }
    }
}
