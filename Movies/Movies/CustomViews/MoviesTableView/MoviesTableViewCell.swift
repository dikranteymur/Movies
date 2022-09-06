//
//  MoviesTableViewCell.swift
//  Movies
//
//  Created by Dikran Teymur on 6.09.2022.
//

import UIKit

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

    func setCell() {
        
    }
}
