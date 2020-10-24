//
//  GalleriesViewController+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

// MARK: - Constraints

extension GalleriesViewController {
    
    func addButtonBack() {
        view.addSubview(buttonBack)
        buttonBack.translatesAutoresizingMaskIntoConstraints = false
        buttonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        buttonBack.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
    }
    
    func addTitle() {
        view.addSubview(labelTitle)
        labelTitle.translatesAutoresizingMaskIntoConstraints = false
        labelTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        labelTitle.rightAnchor.constraint(equalTo: buttonBack.leftAnchor, constant: -16).isActive = true
        labelTitle.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 16).isActive = true
    }
}
