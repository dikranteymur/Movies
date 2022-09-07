//
//  DetailScreenViewController.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

final class DetailScreenViewController: BaseScreenViewController {
    @IBOutlet private weak var movieCustomImageView: CustomImageView!
    @IBOutlet private weak var customRateView: CustomRateView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    var viewModel: DetailScreenViewModelProtocol? {
        didSet {
            viewModel?.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.load()
        viewModel?.load()

        setupUI()
    }

    private func setupUI() {
        titleLabel.font = .bold20
        titleLabel.textColor = .tmTextBlack

        descriptionLabel.font = .regular15
        descriptionLabel.textColor = .tmTextBlack
    }
}

extension DetailScreenViewController: DetailScreenViewModelDelegate {
    func handleOutput(_ output: DetailScreenViewModeOutput) {
        switch output {
        case .updateTitle(let title):
            navigationItem.title = title
        case .setLoading(let isLoading):
            print(isLoading)
        }
    }


}
