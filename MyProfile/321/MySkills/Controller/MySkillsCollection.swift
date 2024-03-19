//
//  MySkillsCollection.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 12.09.2023.
//

import UIKit

class MySkillsCollection: UITableViewCell {

    static let ID = "MySkillsCollection"

    //MARK: - Private properties

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)

        return vc
    }()

    var addACClosure:(() -> Void)?


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
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }

    private func detailsCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(
            MySkillsCell.self,
            forCellWithReuseIdentifier: MySkillsCell.ID)
    }
}

//MARK: - Collection view data source

extension MySkillsCollection: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataBase.skillsArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MySkillsCell.ID,
            for: indexPath
        ) as? MySkillsCell else { return UICollectionViewCell() }

        let skills = DataBase.skillsArray[indexPath.row]
        cell.configureTitle(title: skills)
        cell.expandedCell()
//        cell.collapsedCell()

        cell.crossActionClosure = { [weak self] in
            DataBase.skillsArray.remove(at: indexPath.row)
            self?.collectionView.deleteItems(at: [indexPath])
            self?.collectionView.reloadData()
        }

        return cell
    }

    //MARK: - Collection view didSelectItemAt

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        addACClosure?()
    }

    //MARK: -

    func reloadCollectionView() {
        self.collectionView.reloadData()
    }
}

//MARK: - Collection view flow layout

extension MySkillsCollection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let skillsArray = DataBase.skillsArray[indexPath.row]

        let availableWidth = collectionView.frame.width - 16 - 16
        let constraintTitleLabel = CGSize(width: CGFloat.greatestFiniteMagnitude, height: 44)

        let titleLabel = UILabel()
        titleLabel.text = skillsArray
        let labelSize = titleLabel.sizeThatFits(constraintTitleLabel)

        let itemWidth = 24 + labelSize.width + 24

//        if mySkills.isEditing == false {
//            if itemWidth < availableWidth {
//                return CGSize(width: itemWidth, height: 44)
//            } else {
//                return CGSize(width: availableWidth, height: 44)
//            }
//
//        } else if mySkills.isEditing == true {
//            if itemWidth < availableWidth {
//                return CGSize(width: itemWidth + 10 + 14, height: 44)
//            } else {
//                return CGSize(width: availableWidth, height: 44)
//            }
//        }

        return CGSize(width: availableWidth, height: 44)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }

}
