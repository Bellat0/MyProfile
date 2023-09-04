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
    private let editButton = UIButton(type: .system)
    
    var editButtonTapped: (() -> Void)?
    
    //MARK: - Lyfe cycle
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
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
    
    func addEditButton(isSelected: Bool) {
        contentView.addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        editButton.tintColor = .black
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        editButton.setImage(
            isSelected ? UIImage(named: "pencilIcon")
            : UIImage(named: "okIcon"), for: .normal)
        
        let pinRightEditButton = NSLayoutConstraint(item: editButton, attribute: .trailing, relatedBy: .equal, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -16)
        let centerYEditButton = NSLayoutConstraint(item: editButton, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)
        
        contentView.addConstraints([pinRightEditButton, centerYEditButton])
    }
    
    //MARK: - Action methods
    
    @objc func editButtonAction() {
        editButtonTapped?()
    }
}
