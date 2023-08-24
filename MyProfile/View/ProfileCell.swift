//
//  MainTableViewCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class ProfileCell: UITableViewCell {

    static let ID = "ProfileCell"

    //MARK: - Private properties

    private let userIconImage = UIImageView()
    private let userNameLabel = UILabel()
    private let aboutMeLabel = UILabel()
    private let locationIconImage = UIImageView()
    private let locationLabel = UILabel()
    private let stackView = UIStackView()

    //MARK: - Lyfe cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.backgroundColor = Colors.LightGrayBGColor

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods

    private func setupViews() {

        contentView.addSubview(userIconImage)
        userIconImage.translatesAutoresizingMaskIntoConstraints = false
        userIconImage.frame.size.width = 120
        userIconImage.frame.size.height = 120
        userIconImage.layer.cornerRadius = userIconImage.frame.size.width / 2
        userIconImage.clipsToBounds = true

        contentView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        userNameLabel.numberOfLines = 0
        userNameLabel.textAlignment = .center

        contentView.addSubview(aboutMeLabel)
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.font = UIFont.systemFont(ofSize: 14)
        aboutMeLabel.textColor = Colors.LightGrayColor
        aboutMeLabel.numberOfLines = 2
        aboutMeLabel.textAlignment = .center

        contentView.addSubview(locationIconImage)
        locationIconImage.image = UIImage(named: "locationIcon")

        contentView.addSubview(locationLabel)
        locationLabel.text = "Алмат31312"
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = Colors.LightGrayColor

        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(locationIconImage)
        stackView.addArrangedSubview(locationLabel)
        stackView.alignment = .leading
    }

    private func setupConstraints() {

        let pinTopIconImage = NSLayoutConstraint(item: userIconImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 24)
        let centerXIconImage = NSLayoutConstraint(item: userIconImage, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let heightIconImage = NSLayoutConstraint(item: userIconImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0, constant: 120)
        let widthIconImage = NSLayoutConstraint(item: userIconImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0, constant: 120)

        let pinLeftUserNameLabel = NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 51)
        let pinTopUserNameLabel = NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: userIconImage, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 16)
        let pinRightUserNameLabel = NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -51)


        let pinLeftAboutMeLabel = NSLayoutConstraint(item: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 51)
        let pinTopAboutMeLabel = NSLayoutConstraint(item: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: userNameLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 8)
        let pinRightAboutMeLabel = NSLayoutConstraint(item: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -51)


        let pinTopLocationStackView = NSLayoutConstraint(item: stackView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 4)
        let centerXStackView = NSLayoutConstraint(item: stackView, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let pinBotLocationStackView = NSLayoutConstraint(item: stackView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: -24)


        contentView.addConstraints([pinTopIconImage, centerXIconImage, heightIconImage, widthIconImage, pinLeftUserNameLabel, pinTopUserNameLabel, pinRightUserNameLabel, pinLeftAboutMeLabel, pinTopAboutMeLabel, pinRightAboutMeLabel, pinTopLocationStackView, pinBotLocationStackView, centerXStackView])
    }

    //MARK: - Configure methods

    func configureCell(profile: ProfileModel) {
        self.userIconImage.image = UIImage(named: profile.image)
        self.userNameLabel.text = profile.title
        self.aboutMeLabel.text = profile.description
        self.locationLabel.text = profile.location
    }
}
