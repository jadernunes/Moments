//
//  InfoView+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

// MARK: - Constraints

extension InfoView {
    
    func addImageView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8).isActive = true
        imageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
    }
    
    func addLabelInfo() {
        addSubview(labelInfo)
        labelInfo.translatesAutoresizingMaskIntoConstraints = false
        labelInfo.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8).isActive = true
        labelInfo.rightAnchor.constraint(equalTo: rightAnchor, constant: -8).isActive = true
        labelInfo.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        labelInfo.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        labelInfo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
    }
}
