//
//  ViewController.swift
//  MyProfile
//
//  Created by Maxim Tvilinev on 01.08.2023.
//

import UIKit

class MainViewController: UIViewController {

    private let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.LightGrayBGColor

        setupViews()
        setupConstraints()
        detailsTableView()
    }

    private func setupViews() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
    }

    private func setupConstraints() {
        let pinLeft = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.leading, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.leading, multiplier: 1, constant: 0)
        let pinTop = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view.safeAreaLayoutGuide, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0)
        let pinRight = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0)
        let pinBot = NSLayoutConstraint(item: tableView, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0)

        view.addConstraints([pinLeft, pinTop, pinRight, pinBot])
    }

    private func detailsTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedSectionHeaderHeight = 0
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.rowHeight = UITableView.automaticDimension

        tableView.register(
            HeaderSectionView.self,
            forHeaderFooterViewReuseIdentifier: HeaderSectionView.ID)

        tableView.register(
            ProfileCell.self,
            forCellReuseIdentifier: ProfileCell.ID)

        tableView.register(
            SkillsCollectionViewCell.self,
            forCellReuseIdentifier: SkillsCollectionViewCell.ID)

        tableView.register(
            AboutMeCell.self,
            forCellReuseIdentifier: AboutMeCell.ID)
    }
}


//MARK: Table view data source

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if indexPath.section == 0 {

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: ProfileCell.ID,
                for: indexPath) as? ProfileCell else { return UITableViewCell() }

            cell.selectionStyle = .none
            
            return cell
        } else if indexPath.section == 1 {

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: SkillsCollectionViewCell.ID,
                for: indexPath
            ) as? SkillsCollectionViewCell else { return UITableViewCell() }

            cell.presentAC = { [weak self] in
                self?.createAc()
            }

            return cell

        } else if indexPath.section == 2 {

            guard let cell = tableView.dequeueReusableCell(
                withIdentifier: AboutMeCell.ID,
                for: indexPath) as? AboutMeCell else { return UITableViewCell() }

            cell.selectionStyle = .none

            return cell
        }

        return UITableViewCell()
    }

    //MARK: Table view header view

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(
            withIdentifier: HeaderSectionView.ID
        ) as? HeaderSectionView else { return  nil }

        if section == 0 {
            return nil
        } else if section == 1 {
            headerView.configureTitle(title: "Мои навыки")
            headerView.setupClickButton(isPressed: false)
            headerView.setupConstraintsClickButton()
        } else if section == 2 {
            headerView.configureTitle(title: "О себе")
        }

        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 40
        }
    }
}
