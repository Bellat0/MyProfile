//
//  HeaderView.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class HeaderSectionView: UITableViewHeaderFooterView {

    static let ID = "HeaderView"

    private let titleLabel = UILabel()
    private let clickButton = UIButton()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupTitleLabel()
        setupConstraintsTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    }

    private func setupConstraintsTitleLabel() {
        let pinLeftLocationLabel = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 16)
        let centerYTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)

        contentView.addConstraints([pinLeftLocationLabel, centerYTitleLabel])
    }

    func configureTitle(title: String) {
        self.titleLabel.text = title
    }

    func setupClickButton() {
        contentView.addSubview(clickButton)
        clickButton.translatesAutoresizingMaskIntoConstraints = false
        clickButton.setImage(UIImage(named: "pencil"), for: .normal)
    }

    func setupConstraintsClickButton() {
        let pinRightClickButton = NSLayoutConstraint(item: clickButton, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -16)
        let centerYClickButton = NSLayoutConstraint(item: clickButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)

        contentView.addConstraints([pinRightClickButton, centerYClickButton])
    }
}
