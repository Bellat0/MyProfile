//
//  AboutMeCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class AboutMeCell: UITableViewCell {

    static let ID = "AboutMeCell"

    private let descriptionLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "iOS - developer \nС 2016 года по 2019 год работал дизайнером-инфографики в \"Министерстве Образования Республики Казахстан\" \nС 2019 года по 2020 год работал UX-аналитиком в \"Фонд образования Нурсултана Назарбаева\" \nС 2020 года занимался собственными проектами \nЕсть опыт преподавания языка Swift на курсах по программированию"

        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
    }

    private func setupConstraints() {
        let pinLeftDescriptionLabel = NSLayoutConstraint(item: descriptionLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 16)
        let pinTopDescriptionLabel = NSLayoutConstraint(item: descriptionLabel, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 0)
        let pinRightDescriptionLabel = NSLayoutConstraint(item: descriptionLabel, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -16)
        let pinBottDescriptionLabel = NSLayoutConstraint(item: descriptionLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: 0)

        contentView.addConstraints([pinLeftDescriptionLabel, pinTopDescriptionLabel, pinRightDescriptionLabel, pinBottDescriptionLabel])
    }
}
