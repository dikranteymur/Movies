//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit
import SDWebImage

final class MoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    private func setupUI() {
        movieImageView.layer.cornerRadius = 16
        movieImageView.clipsToBounds = true

        titleLabel.font = .bold15
        titleLabel.textColor = .tmTextBlack

        descriptionLabel.font = .medium13
        descriptionLabel.textColor = .tmTextGray

        dateLabel.font = .medium12
        dateLabel.textColor = .tmTextGray
    }

    func setCell(model: MovieResult) {
        if let path = model.backdrop_path {
            let urlString = app.service.imageBaseUrl + path
            let url = URL(string: urlString)
            movieImageView.sd_setImage(with: url)
        }

        if let title = model.title {
            if let year = model.release_date?.split(separator: "-").first {
                let formattedTitle = title + "(\(year))"
                titleLabel.text = formattedTitle
            } else {
                titleLabel.text = title
            }
        }

        if let overview = model.overview {
            descriptionLabel.text = overview
        }

        if let releaseDate = model.release_date {
            dateLabel.text = releaseDate.toDateFormat
        }


    }
}
