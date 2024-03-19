//
//  ProfileViewController + TableView.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 19.03.2024.
//

import UIKit

// MARK: - Table view data source

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0

        tableView.register(
            HeaderSectionView.self,
            forHeaderFooterViewReuseIdentifier: HeaderSectionView.ID)

        tableView.register(
            UserInfoCell.self,
            forCellReuseIdentifier: UserInfoCell.ID)

        tableView.register(
            AboutMeCell.self,
            forCellReuseIdentifier: AboutMeCell.ID)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: UserInfoCell.ID,
                for: indexPath
            ) as? UserInfoCell else { return UITableViewCell() }

            return cell

        case 2:
            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AboutMeCell.ID,
                for: indexPath
            ) as? AboutMeCell else { return UITableViewCell() }

            return cell

        default: return UITableViewCell()
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerSection = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderSectionView.ID
        ) as? HeaderSectionView else { return nil }

        switch section {
        case 0: return nil
        case 1:
            headerSection.configure(title: Titles.firstHeaderSection)
            headerSection.editButton.isHidden = false
            
            headerSection.isSelected = profile.isEditing
            headerSection.editButtonSelectionHandler = { [weak self] in
                guard let self = self else { return }
                self.profile.isEditing.toggle()
                self.tableView.reloadData()
            }

        case 2:
            headerSection.configure(title: Titles.secondHeaderSection)
            headerSection.editButton.isHidden = true

        default: break
        }

        return headerSection
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0: return 0
        default: return 50
        }
    }
}
