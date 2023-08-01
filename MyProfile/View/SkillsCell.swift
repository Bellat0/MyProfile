//
//  SkillsCell.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class SkillsCell: UICollectionViewCell {

    static let ID = "SkillsCell"

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let vc = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return vc
    }()
}
