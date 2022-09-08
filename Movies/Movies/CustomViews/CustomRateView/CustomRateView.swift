//
//  CustomRateView.swift
//  Movies
//
//  Created by Dikran Teymur on 7.09.2022.
//

import UIKit

final class CustomRateView: UIView {
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var rateAttLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed(CustomRateView.className, owner: self)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        setupUI()
    }

    private func setupUI() {
//        rateAttLabel =
        dateLabel.font = .medium13
        dateLabel.textColor = .tmTextBlack
    }

    func setRateLabel(value: Double) {
        rateAttLabel.font = .medium13
        rateAttLabel.textColor = .tmDarkGray
        let text = value.setFormatted(fractionDigit: 1) + "/10"
        let attributedString = NSMutableAttributedString(string: text)
        let range = NSRange(location: 0, length: 3)
        attributedString.addAttributes([NSAttributedString.Key.foregroundColor : UIColor.tmTextBlack], range: range)
        rateAttLabel.attributedText = attributedString
    }

    func setDateLabel(value: String) {
        let formattedDate = value.toDateFormat
        dateLabel.text = formattedDate
    }
}
