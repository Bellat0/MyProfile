//
//  SkillsCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class SkillsCell: UICollectionViewCell {

    static let ID = "SkillsCell"

    private let titleLabel = UILabel()
    private let deleteButton = UIButton()
    private let addButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        layer.cornerRadius = 12
        backgroundColor = Colors.LightGrayBGColor

        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 14)

        contentView.addSubview(addButton)
        addButton.setTitle("+", for: .normal)

        contentView.addSubview(deleteButton)
    }

    private func setupConstraints() {

        let centerXTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)


        contentView.addConstraints([centerXTitleLabel, centerYTitleLabel])
    }

    func setupAddButton() {

        let centerXAddButton = NSLayoutConstraint(item: addButton, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
        let centerYAddButton = NSLayoutConstraint(item: addButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)

        contentView.addConstraints([centerXAddButton, centerYAddButton])
    }

    func configureCell(title: String) {
        self.titleLabel.text = title
    }
}
