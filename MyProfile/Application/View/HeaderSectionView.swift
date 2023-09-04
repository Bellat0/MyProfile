//
//  HeaderView.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class HeaderSectionView: UITableViewHeaderFooterView {

    static let ID = "HeaderView"

    //MARK: - Private properties

    private let titleLabel = UILabel()
    private let addButton = UIButton(type: .system)

    var addButtonTapped: (() -> Void)?

    //MARK: - Lyfe cycle

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

//        contentView.backgroundColor = .red
        
        setupTitleLabel()
        setupConstraintsTitleLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods

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

    //MARK: - Configure methods

    func configureTitle(title: String) {
        self.titleLabel.text = title
    }

    func setupClickButton(isPressed: Bool) {

        contentView.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.tintColor = .black
        addButton.setImage(UIImage(systemName: "plus"), for: .normal)

        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }

    func setupConstraintsClickButton() {

        let pinRightClickButton = NSLayoutConstraint(item: addButton, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -16)
        let centerYClickButton = NSLayoutConstraint(item: addButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        let widthDeleteButton = NSLayoutConstraint(item: addButton, attribute: .width, relatedBy: .equal, toItem: contentView, attribute: .width, multiplier: 0, constant: 16)
        let heightDeleteButton = NSLayoutConstraint(item: addButton, attribute: .height, relatedBy: .equal, toItem: contentView, attribute: .height, multiplier: 0, constant: 16)

        contentView.addConstraints([pinRightClickButton, centerYClickButton, widthDeleteButton, heightDeleteButton])
    }

    //MARK: - Action methods
    
    @objc private func addButtonAction() {
        //        editButton.setImage(UIImage(named: "ok"), for: .normal)

        addButtonTapped?()
    }
}
