//
//  MainTableViewCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class UserInfoCell: UITableViewCell {

    static let ID = "UserInfoCell"

    // MARK: - Properties

    private let avatarImageView = UIImageView()
    private let fullNameLabel = UILabel()
    private let aboutMeLabel = UILabel()

    private let locationIconImageView = UIImageView()
    private let cityLabel = UILabel()
    private let locationStackView = UIStackView()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setupViews() {
        contentView.backgroundColor = .systemGray6

        contentView.addSubview(avatarImageView)
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        avatarImageView.backgroundColor = .blue
        avatarImageView.frame.size.width = 120
        avatarImageView.frame.size.height = 120
        avatarImageView.layer.cornerRadius = avatarImageView.frame.width / 2
        avatarImageView.clipsToBounds = true

        contentView.addSubview(fullNameLabel)
        fullNameLabel.translatesAutoresizingMaskIntoConstraints = false
        fullNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        fullNameLabel.textAlignment = .center
        fullNameLabel.numberOfLines = 0

        for textSettings in [aboutMeLabel, cityLabel] {
            contentView.addSubview(textSettings)
            textSettings.translatesAutoresizingMaskIntoConstraints = false
            textSettings.font = UIFont.systemFont(ofSize: 14)
            textSettings.textColor = .systemGray
            textSettings.numberOfLines = 0
        }
        aboutMeLabel.textAlignment = .center

        contentView.addSubview(locationStackView)
        locationStackView.translatesAutoresizingMaskIntoConstraints = false
        locationStackView.addArrangedSubview(locationIconImageView)
        locationStackView.addArrangedSubview(cityLabel)

        avatarImageView.image = Titles.avatar
        fullNameLabel.text = Titles.fullName
        aboutMeLabel.text = Titles.aboutMe
        locationIconImageView.image = Titles.locationIcon
        cityLabel.text = Titles.city
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            avatarImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),

            fullNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            fullNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            fullNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -32),

            aboutMeLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 8),
            aboutMeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            aboutMeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            locationStackView.topAnchor.constraint(equalTo: aboutMeLabel.bottomAnchor, constant: 4),
            locationStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            locationStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -24)
        ])
    }
}
