//
//  SkillsCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class SkillsCell: UICollectionViewCell {

    static let ID = "SkillsCell"

    var deleteButtonDeleteAction: (() -> Void)?

    private let titleLabel = UILabel()
    private let deleteButton = UIButton()
    //    private let addButton = UIButton()

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

        contentView.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        //        deleteButton.isHidden = true
        deleteButton.setImage(UIImage(named: "deleteButton"), for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)

        //        contentView.addSubview(addButton)
        //        addButton.translatesAutoresizingMaskIntoConstraints = false
        //        addButton.layer.cornerRadius = 12
        //        addButton.backgroundColor = Colors.LightGrayBGColor
        //        addButton.setTitle("+", for: .normal)
        //        addButton.setTitleColor(.black, for: .normal)
        //        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }

    private func setupConstraints() {

        //        let widthAddButton = NSLayoutConstraint(item: addButton, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 1, constant: 57)
        //        let heightAddButton = NSLayoutConstraint(item: addButton, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 1, constant: 44)
        //        let centerYAddButton = NSLayoutConstraint(item: addButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        //        let centerXAddButton = NSLayoutConstraint(item: addButton, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)

        //        if !deleteButton.isHidden {
        //
        //            let leadingTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 10)
        //            let trailingTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: deleteButton, attribute: .leading, multiplier: 1, constant: -10)
        //            let centerYTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        //
        //
        //            let trailingDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -24)
        //            let centerYDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        //            let widthDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 0, constant: 14)
        //            let heightDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 0, constant: 14)
        //
        //            contentView.addConstraints([trailingDeleteButton, centerYDeleteButton, widthDeleteButton, heightDeleteButton, leadingTitleLabel, trailingTitleLabel, centerYTitleLabel, widthAddButton, heightAddButton, centerYAddButton, centerXAddButton])
        //        } else {
        //
        //            let centerYTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        //            let centerXTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)
        //
        //            contentView.addConstraints([centerXTitleLabel, centerYTitleLabel, centerYAddButton, centerXAddButton])
        //        }

        //MARK: -

        let leadingTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 10)
        let trailingTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .trailing, relatedBy: .equal, toItem: deleteButton, attribute: .leading, multiplier: 1, constant: -10)
        let centerYTitleLabel = NSLayoutConstraint(item: titleLabel, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)


        let trailingDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -24)
        let centerYDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        let widthDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 0, constant: 14)
        let heightDeleteButton = NSLayoutConstraint(item: deleteButton, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 0, constant: 14)

        contentView.addConstraints([trailingDeleteButton, centerYDeleteButton, widthDeleteButton, heightDeleteButton, leadingTitleLabel, trailingTitleLabel, centerYTitleLabel])
    }

    @objc private func deleteButtonAction() {
        deleteButtonDeleteAction?()
    }

    //    @objc private func addButtonAction() {
    //
    //    }

    func configureCell(title: String) {
        self.titleLabel.text = title
    }
}
