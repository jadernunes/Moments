//
//  GalleryCell.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import UIKit

final class GalleryCell: UICollectionViewCell {
    
    // MARK: - Attributes
    
    private var viewModel: GalleryCellViewModelProtocol?
    
    // MARK: - Elements
    
    private(set) lazy var viewContent = UIView()
    private(set) lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    private(set) var stack: UIStackView? {
        didSet {
            stack?.axis = .horizontal
            stack?.distribution = .fillEqually
            stack?.alignment = .center
            stack?.backgroundColor = .darkGray()
            stack?.cornerRadius(value: 4)
            stack?.clipsToBounds = true
            createStack()
        }
    }
    
    // MARK: - Life cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom methods
    
    private func setupUI() {
        createViewContent()
        createImageCover()
    }
    
    func configure(viewModel: GalleryCellViewModelProtocol) {
        self.viewModel = viewModel
        populateData()
    }
    
    private func populateData() {
        bindImageView()
        viewModel?.loadImage()
        
        stack = UIStackView(arrangedSubviews: [
            createInfoView(iconName: "upload", count: viewModel?.countUps ?? 0),
            createInfoView(iconName: "comments", count: viewModel?.countComments ?? 0),
            createInfoView(iconName: "views", count: viewModel?.countViews ?? 0)
        ])
    }
}

// MARK: - Binds

extension GalleryCell {
    
    func bindImageView() {
        viewModel?.urlImage.bindAndFire { [weak self] urlImage in
            self?.imageView.addImage(path: urlImage)
        }
    }
}
