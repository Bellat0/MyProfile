//
//  AlertController + MainVC.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 02.08.2023.
//

import UIKit

//extension ProfileViewController {
//
//    func createAC() {
//        let ac = UIAlertController(
//            title: "Добавление навыка",
//            message: "Введите название навыка которым вы владеете",
//            preferredStyle: .alert)
//
//        ac.addTextField() { tf in
//            tf.placeholder = "Введите название"
//        }
//
//        let cancelAction = UIAlertAction(title: "Отмена", style: .default)
//
//        let addAction = UIAlertAction(title: "Добавить", style: .default) { action in
//            let text = ac.textFields?.first
//            guard let newText = text?.text else { return }
//
//            if newText != "" {
//                DataBase.skillsArray.insert(newText, at: 0)
//                self.tableView.reloadData()
//            }
//        }
//
//        ac.addAction(cancelAction)
//        ac.addAction(addAction)
//
//        present(ac, animated: true)
//    }
//
//    func heightForHeader() -> CGFloat {
//
//        let profile = profile[0]
//        let constraintsForLabels = CGSize(width: UIScreen.main.bounds.width - 16 - 16, height: CGFloat.greatestFiniteMagnitude)
//
//        let userNameLabel = UILabel()
//        userNameLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
//        userNameLabel.text = profile.title
//        userNameLabel.numberOfLines = 0
//        let userNameLabelSize = userNameLabel.sizeThatFits(constraintsForLabels)
//
//        let aboutMeLabel = UILabel()
//        aboutMeLabel.font = UIFont.systemFont(ofSize: 14)
//        aboutMeLabel.text = profile.description
//        aboutMeLabel.numberOfLines = 0
//        let aboutMeLabellSize = aboutMeLabel.sizeThatFits(constraintsForLabels)
//
//        let locationLabel = UILabel()
//        locationLabel.font = UIFont.systemFont(ofSize: 14)
//        locationLabel.text = profile.location
//        locationLabel.numberOfLines = 0
//        let locationLabelSize = locationLabel.sizeThatFits(constraintsForLabels)
//
//        let headerHeight = 24 + 120 + 16 + 4 + 2 + 24 + userNameLabelSize.height + aboutMeLabellSize.height + locationLabelSize.height
//
//        return headerHeight
//    }
//}
