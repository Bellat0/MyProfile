//
//  MainTableViewCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class ProfileCell: UITableViewCell {

    static let ID = "ProfileCell"

    private let rectView = UIView()
    private let userIconImage = UIImageView()
    private let userNameLabel = UILabel()
    private let aboutMeLabel = UILabel()
    private let locationIconImage = UIImageView()
    private let locationLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstrints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

        contentView.addSubview(rectView)
        rectView.translatesAutoresizingMaskIntoConstraints = false
        rectView.backgroundColor = Colors.LightGrayBGColor

        contentView.addSubview(userIconImage)
        userIconImage.translatesAutoresizingMaskIntoConstraints = false
        userIconImage.image = UIImage(named: "userIcon")
        userIconImage.backgroundColor = .red
        userIconImage.frame.size.width = 128
        userIconImage.frame.size.height = 128
        userIconImage.layer.cornerRadius = userIconImage.frame.size.width / 2
        userIconImage.clipsToBounds = true

        contentView.addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.text = "Твилинев Максим Александрович"
        userNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        userNameLabel.numberOfLines = 2
        userNameLabel.textAlignment = .center

        contentView.addSubview(aboutMeLabel)
        aboutMeLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutMeLabel.text = "Junior iOS-разработчик, опыт более 0 лет"
        aboutMeLabel.font = UIFont.systemFont(ofSize: 14)
        aboutMeLabel.textColor = Colors.LightGrayColor

        contentView.addSubview(locationIconImage)
        locationIconImage.translatesAutoresizingMaskIntoConstraints = false
        locationIconImage.image = UIImage(named: "locationIcon")


        contentView.addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.text = "Алматы"
        locationLabel.font = UIFont.systemFont(ofSize: 14)
        locationLabel.textColor = Colors.LightGrayColor

    }

    private func setupConstrints() {

        let heightContentView = NSLayoutConstraint(item: contentView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0, constant: 287)

        let pinLeftRectView = NSLayoutConstraint(item: rectView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let pinTopRectView = NSLayoutConstraint(item: rectView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let pinRightRectView = NSLayoutConstraint(item: rectView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        let heightRectView = NSLayoutConstraint(item: rectView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0, constant: 287)

        let pinTopIconImage = NSLayoutConstraint(item: userIconImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 24)
        let centerXIconImage = NSLayoutConstraint(item: userIconImage, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let heightIconImage = NSLayoutConstraint(item: userIconImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0, constant: 128)
        let widthIconImage = NSLayoutConstraint(item: userIconImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0, constant: 128)

        let pinLeftUserNameLabel = NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 80)
        let pinTopUserNameLabel = NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: userIconImage, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 16)
        let pinRightUserNameLabel = NSLayoutConstraint(item: userNameLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -80)


        let pinLeftAboutMeLabel = NSLayoutConstraint(item: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 51)
        let pinTopAboutMeLabel = NSLayoutConstraint(item: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: userNameLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 4)
        let pinRightAboutMeLabel = NSLayoutConstraint(item: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -51)

        let pinLeftLocationIconImage = NSLayoutConstraint(item: locationIconImage, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 150)
        let pinTopLocationIconImage = NSLayoutConstraint(item: locationIconImage, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 2)
        let heightLocationIconImage = NSLayoutConstraint(item: locationIconImage, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0, constant: 16)
        let widthLocationIconImage = NSLayoutConstraint(item: locationIconImage, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.width, multiplier: 0, constant: 16)

        let pinLeftLocationLabel = NSLayoutConstraint(item: locationLabel, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: locationIconImage, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 20)
        let pinTopLocationLabel = NSLayoutConstraint(item: locationLabel, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: aboutMeLabel, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        let pinRightLocationLabel = NSLayoutConstraint(item: locationLabel, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -150)


        contentView.addConstraints([pinLeftRectView, pinTopRectView, pinRightRectView, heightRectView, heightContentView, pinTopIconImage, centerXIconImage, heightIconImage, widthIconImage, pinLeftUserNameLabel, pinTopUserNameLabel, pinRightUserNameLabel, pinLeftAboutMeLabel, pinTopAboutMeLabel, pinRightAboutMeLabel, pinLeftLocationIconImage, pinTopLocationIconImage, heightLocationIconImage, widthLocationIconImage, pinLeftLocationLabel, pinTopLocationLabel, pinRightLocationLabel])
    }
}
