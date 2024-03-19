//
//  MySkillsCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 12.09.2023.
//

import UIKit

private let reuseIdentifier = "Cell"

class MySkillsCell: UICollectionViewCell {

    static let ID = "MySkillsCell"

    //MARK: - Private properties

    private let titleLabel = UILabel()
    private let crossButton = UIButton()

    var crossActionClosure: (() -> Void)?

    //MARK: - Lyfe cycle

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = Colors.LightGrayBGColor
        contentView.layer.cornerRadius = 12

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods

    func expandedCell() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }

    func collapsedCell() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center

        contentView.addSubview(crossButton)
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        crossButton.setImage(UIImage(named: "deleteButton"), for: .normal)
        crossButton.addTarget(self, action: #selector(crossAction), for: .touchUpInside)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),

            crossButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            crossButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            crossButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }

    //MARK: - Configure methods

    func configureTitle(title: String) {
        self.titleLabel.text = title
    }

    //MARK: - Actions

    @objc private func crossAction() {
        crossActionClosure?()
    }
}
