//
//  FakeDataBase.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 02.08.2023.
//

import Foundation

//MARK: - Profile

let profileArray = [
    ProfileModel(image: "userIcon",
                 title: "Твилинев Максим Александрович",
                 description: "Junior iOS-разработчик",
                 location: "Алматы")
]

//MARK: - Skills

var skillsArray = ["Swift", "UiKit", "Git", "MVC", "MVVM", "SnapKit", "Alamofire"]

//MARK: - About me

var aboutMeDescription = AboutMe(title: "iOS - developer \n2016-2019: дизайнер-инфографики в \"Министерство Образования Республики Казахстан\" \n2019-2020: UX-аналитик в \"Фонд образования Нурсултана Назарбаева\" \n2020: работа над собственными проектами")
