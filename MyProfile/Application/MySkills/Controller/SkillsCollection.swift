//
//  SkillsCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class SkillsCollectionViewCell: UITableViewCell {

    static let ID = "SkillsCell"

    //MARK: - Enum for CollectionView Insets

    private enum Layout {
        static let insets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    }

    //MARK: - Private properties

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return vc
    }()

    //MARK: - Action properties

    var presentAC: (() -> Void)?

    //MARK: - Lyfe cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
        detailsCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Private methods

    private func setupViews() {
        contentView.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }

    private func setupConstraints() {
        let pinLeft = NSLayoutConstraint(item: collectionView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let pinTop = NSLayoutConstraint(item: collectionView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let pinRight = NSLayoutConstraint(item: collectionView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        let pinBot = NSLayoutConstraint(item: collectionView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)
        let heightContentView = NSLayoutConstraint(item: contentView, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: contentView, attribute: NSLayoutConstraint.Attribute.height, multiplier: 0, constant: 200)


        contentView.addConstraints([pinLeft, pinTop, pinRight, pinBot, heightContentView])
    }

    private func detailsCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(
            SkillsCell.self,
            forCellWithReuseIdentifier: SkillsCell.ID)
    }
}

//MARK: - Collection view data source

extension SkillsCollectionViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return skillsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SkillsCell.ID,
            for: indexPath
        ) as? SkillsCell else { return UICollectionViewCell() }

        cell.deleteButtonDeleteAction = {
            if indexPath.row < skillsArray.count  {
                skillsArray.remove(at: indexPath.row)
                collectionView.deleteItems(at: [indexPath])
            }
        }

        let skills = skillsArray[indexPath.row]
        cell.configureCell(title: skills)

        return cell
    }

    //MARK: - Collection view didSelectItemAt

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
}

//MARK: - CollectionViewDelegateFlowLayout

extension SkillsCollectionViewCell: UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let dataBase = skillsArray[indexPath.row]

        let availableWidth = collectionView.frame.width - 16 - 16

        let titleLabel = UILabel()
        titleLabel.text = dataBase
        let constraintTitleLabel = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 20)
        let labelSize = titleLabel.sizeThatFits(constraintTitleLabel)

        let itemWidth = 24 + labelSize.width + 24

        if itemWidth > availableWidth {
            return CGSize(width: availableWidth, height: 44)
        }

        return CGSize(width: itemWidth, height: 44)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return Layout.insets
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return Layout.insets.bottom
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {

        return 10
    }
}
