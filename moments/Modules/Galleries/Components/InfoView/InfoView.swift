//
//  InfoView.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import UIKit

final class InfoView: UIView {
    
    // MARK: - Elements
    
    private(set) lazy var imageView = UIImageView()
    private(set) lazy var labelInfo: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray()
        return label
    }()
    
    // MARK: - Life cycle
    
    init(iconName:  String, count: Int) {
        super.init(frame: .zero)
        
        populateData(icon: iconName, count: count)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom methods
    
    private func populateData(icon: String, count: Int) {
        labelInfo.text = count.countFriendly()
        imageView.image = UIImage(named: icon)
    }
    
    private func setupUI() {
        addImageView()
        addLabelInfo()
    }
}
