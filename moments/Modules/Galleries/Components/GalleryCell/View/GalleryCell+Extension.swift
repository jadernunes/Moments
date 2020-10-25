//
//  GalleryCell+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import UIKit

// MARK: - Create elements

extension GalleryCell {
    
    func createViewContent() {
        addSubview(viewContent)
        viewContent.backgroundColor = .lightGray
        viewContent
            .cornerRadius(value: 8)
            .addShadow()
            .fillSuperview(padding: 4)
            .addSubview(imageView)
    }
    
    func createImageCover() {
        imageView
            .cornerRadius(value: 8)
            .fillSuperview()
            .layer.masksToBounds = true
    }
    
    func createStack() {
        viewContent.addSubview(stack ?? .init())
        stack?.translatesAutoresizingMaskIntoConstraints = false
        stack?.heightAnchor.constraint(equalToConstant: bounds.height * 0.2).isActive = true
        stack?.leftAnchor.constraint(equalTo: viewContent.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        stack?.rightAnchor.constraint(equalTo: viewContent.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        stack?.bottomAnchor.constraint(equalTo: viewContent.safeAreaLayoutGuide.bottomAnchor, constant: 0).isActive = true
    }
    
    func createButtonRefresh() {
        viewContent.addSubview(buttonRefresh)
        buttonRefresh.translatesAutoresizingMaskIntoConstraints = false
        buttonRefresh.centerXAnchor.constraint(equalTo: viewContent.centerXAnchor, constant: 0).isActive = true
        buttonRefresh.topAnchor.constraint(equalTo: viewContent.topAnchor, constant: 0).isActive = true
        buttonRefresh.bottomAnchor.constraint(equalTo: viewContent.bottomAnchor, constant: 0).isActive = true
    }
    
    func createInfoView(iconName: String, count: Int) -> UIView {
        let viewBase = UIView()
        let view = InfoView(iconName: iconName, count: count)
        viewBase.addSubview(view)
        view.centerInSuperview()
        return viewBase
    }
}
