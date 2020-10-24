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
    private(set) lazy var buttonRefresh: UIButton = {
        $0.setImage(UIImage(named: "refresh"), for: .normal)
        $0.tintColor = .darkGray()
        $0.addTarget(self, action: #selector(refreshData), for: .touchUpInside)
        return $0
    }(UIButton())
    
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
    
    private func showLoader() {
        buttonRefresh.removeFromSuperview()
        viewContent.startLoading()
    }
    
    func configure(viewModel: GalleryCellViewModelProtocol) {
        self.viewModel = viewModel
        bindUI()
        populateData()
    }
    
    private func bindUI() {
        bindImageView()
        bindError()
        bindLoader()
    }
    
    private func populateData() {
        refreshData()
        
        stack = UIStackView(arrangedSubviews: [
            createInfoView(iconName: "upload", count: viewModel?.countUps ?? 0),
            createInfoView(iconName: "comments", count: viewModel?.countComments ?? 0),
            createInfoView(iconName: "views", count: viewModel?.countViews ?? 0)
        ])
    }
    
    @objc func refreshData() {
        viewModel?.loadImage()
    }
}

// MARK: - Binds

extension GalleryCell {
    
    func bindLoader() {
        viewModel?.isLoading.bind { [weak self] isLoading in
            isLoading ? self?.showLoader() : self?.viewContent.stopLoading()
        }
    }
    
    func bindImageView() {
        viewModel?.urlImage.bindAndFire { [weak self] urlImage in
            self?.imageView.addImage(path: urlImage)
        }
    }
    
    func bindError() {
        viewModel?.hasError.bind { [weak self] hasError in
            hasError ? self?.createButtonRefresh() : self?.buttonRefresh.removeFromSuperview()
        }
    }
}
