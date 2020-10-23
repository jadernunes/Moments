//
//  HomeViewController+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

// MARK: - Constraints

extension HomeViewController {
    
    func addTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    // MARK: - Table header
    
    func addTitleHeader() {
        viewHeader.addSubview(labelTitleHeader)
        labelTitleHeader.translatesAutoresizingMaskIntoConstraints = false
        labelTitleHeader.topAnchor.constraint(equalTo: viewHeader.topAnchor).isActive = true
        labelTitleHeader.leftAnchor.constraint(equalTo: viewHeader.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        labelTitleHeader.rightAnchor.constraint(equalTo: viewHeader.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
    }
    
    func addSubTitleHeader() {
        viewHeader.addSubview(labelSubHeader)
        labelSubHeader.translatesAutoresizingMaskIntoConstraints = false
        labelSubHeader.topAnchor.constraint(equalTo: labelTitleHeader.bottomAnchor).isActive = true
        labelSubHeader.leftAnchor.constraint(equalTo: viewHeader.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        labelSubHeader.rightAnchor.constraint(equalTo: viewHeader.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
        labelSubHeader.bottomAnchor.constraint(equalTo: viewHeader.bottomAnchor, constant: 0).isActive = true
    }
    
    // MARK: - Table footer
    
    func addTitleFooter() {
        viewFooter.addSubview(labelTitleFooter)
        labelTitleFooter.translatesAutoresizingMaskIntoConstraints = false
        labelTitleFooter.topAnchor.constraint(equalTo: viewFooter.topAnchor).isActive = true
        labelTitleFooter.leftAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        labelTitleFooter.rightAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
    }
    
    func addSubTitleFooter() {
        viewFooter.addSubview(labelSubFooter)
        labelSubFooter.translatesAutoresizingMaskIntoConstraints = false
        labelSubFooter.topAnchor.constraint(equalTo: labelTitleFooter.bottomAnchor).isActive = true
        labelSubFooter.leftAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
        labelSubFooter.rightAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
    }
    
    func addListIcons() {
        viewFooter.addSubview(stackIcons)
        stackIcons.translatesAutoresizingMaskIntoConstraints = false
        stackIcons.topAnchor.constraint(equalTo: labelSubFooter.bottomAnchor, constant: 16).isActive = true
        stackIcons.leftAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        stackIcons.heightAnchor.constraint(equalToConstant: 85).isActive = true
        stackIcons.rightAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        stackIcons.bottomAnchor.constraint(equalTo: viewFooter.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
}
