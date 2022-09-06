//
//  MainScreenViewController.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

final class MainScreenViewController: BaseScreenViewController {
    @IBOutlet weak var bannerView: UIView!
    @IBOutlet weak var moviesTableView: UITableView!
    
    var viewModel: MainScreenViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
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
        }
    }

    func navigate(to route: MainScreenViewModelRoute) {
        switch route {
        case .detail(let viewModel):
            print("go")
        }
    }
}
