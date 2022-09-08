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
        navigationController?.navigationBar.isHidden = false
        viewModel?.load()
        viewModel?.showDetail()
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
        case .showDetail(model: let movieDetail):
            if let path = movieDetail.backdrop_path {
                let urlString = app.service.imageBaseUrl + path
                movieCustomImageView.sd_setImage(with: URL(string: urlString))
                
            }

            customRateView.setRateLabel(value: movieDetail.vote_average ?? 0.0)
            customRateView.setDateLabel(value: movieDetail.release_date ?? "")

            descriptionLabel.text = movieDetail.overview ?? ""

            guard let title = movieDetail.title else { return }
            if let year = movieDetail.release_date?.split(separator: "-").first {
                let formattedTitle = title + "(\(year))"
                titleLabel.text = formattedTitle
            } else {
                titleLabel.text = title
            }
        }
    }


}
