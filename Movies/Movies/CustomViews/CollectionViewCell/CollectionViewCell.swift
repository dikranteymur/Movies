//
//  CollectionViewCell.swift
//  Movies
//
//  Created by Dikran Teymur on 8.09.2022.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var customImageView: CustomImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var pageControlView: UIPageControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        titleLabel.font = .bold20
        titleLabel.textColor = .tmWhite

        descriptionLabel.font = .medium12
        descriptionLabel.textColor = .tmWhite
    }

    func setCell(model: MovieResult) {
        if let imagePath = model.backdrop_path {
            let urlString = app.service.imageBaseUrl + imagePath
            customImageView.sd_setImage(with: URL(string: urlString))
        }

        if let title = model.title {
            titleLabel.text = title
        }

        if let description = model.overview {
            descriptionLabel.text = description
        }
    }
}

