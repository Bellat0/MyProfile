//
//  ProfileModel.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 24.08.2023.
//

import Foundation

struct ProfileModel {
    let image: String
    let title: String
    let description: String
    let location: String
}

struct MySkills {
    var isSelected: Bool = true
}

struct AboutMe {
    let title: String
}
