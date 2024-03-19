//
//  HeaderSectionView.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 12.09.2023.
//

import UIKit

class HeaderSectionView: UITableViewHeaderFooterView {

    static let ID = "HeaderSectionView"

    // MARK: - Propertis

    private let titleLabel = UILabel()
    private(set) var editButton = UIButton()

    var isSelected = false {
        didSet {
            editButton.setImage(
                isSelected
                ? UIImage(named: "okIcon")
                : UIImage(named: "pencilIcon"), for: .normal)
        }
    }

    // MARK: - Handler

    var editButtonSelectionHandler: (() -> Void)?

    // MARK: - Lifecycle

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        setupViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Methods

    private func setupViews() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)

        contentView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: editButton.leadingAnchor, constant: 16),

            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            editButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

    @objc func editButtonAction() {
        editButtonSelectionHandler?()
    }

    // MARK: - Configure

    func configure(title: String) {
        titleLabel.text = title
    }
}
