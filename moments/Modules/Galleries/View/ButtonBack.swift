//
//  ButtonBack.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import UIKit

final class ButtonBack: UIView {
    
    // MARK: - Attributes
    
    private var message = ""
    private var title = ""
    
    // MARK: - Elements
    
    private lazy var labelMessage: UILabel = {
        let label = UILabel()
        label.text = message
        label.font = .systemFont(ofSize: 10, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var labelTitleBack: UILabel = {
        let label = UILabel()
        label.text = title
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    private lazy var imageViewBack: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "back"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    private lazy var stackVertical: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            labelMessage,
            labelTitleBack
        ])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        return stack
    }()
    private lazy var stackHorizontal: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            imageViewBack,
            stackVertical
        ])
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .bottom
        stack.setCustomSpacing(8, after: imageViewBack)
        return stack
    }()
    
    // MARK: - Life cycle
    
    init(message: String, title: String) {
        super.init(frame: .infinite)
        
        self.message = message
        self.title = title
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom methods
    
    private func setupUI() {
        addSubview(stackHorizontal)
        stackHorizontal.fillSuperview()
    }
}
