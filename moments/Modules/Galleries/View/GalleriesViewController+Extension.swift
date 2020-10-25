//
//  GalleriesViewController+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

// MARK: - Constraints

import UIKit

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
    
    func addTableView() {
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: labelTitle.bottomAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addError() {
        view.addSubview(stackError)
        stackError.centerInSuperview()
    }
}
