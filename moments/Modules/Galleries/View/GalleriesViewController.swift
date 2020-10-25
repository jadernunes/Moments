//
//  GalleriesViewController.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import UIKit

private enum ItemsPerPage: Int {
    case portrait = 1, landscape = 2
}

final class GalleriesViewController: BaseViewController {
    
    // MARK: - Attributes
    
    private(set) var viewModel: GalleriesViewModelProtocol?
    
    // MARK: - Elements
    
    private(set) lazy var buttonBack: ButtonBack = {
        let button = ButtonBack(message: .localizable("subtitleHeader"),
                                title: .localizable("titleButtonBack"))
        
        button.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                           action: #selector(buttonBackPressed)))
        return button
    }()
    private(set) lazy var labelTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        label.text = "Top Weekly"
        return label
    }()
    private(set) lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 24
        
        let collectionView = UICollectionView(frame: .infinite, collectionViewLayout: flowLayout)
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.contentInset = .init(top: 16, left: 8, bottom: 16, right: 8)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(GalleryCell.self, forCellWithReuseIdentifier: GalleryCell.className)
        return collectionView
    }()
    private(set) lazy var refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl(frame: .init())
        refresh.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        return refresh
    }()
    private lazy var labelError: UILabel = {
        $0.text = .localizable("erroMessage")
        $0.textColor = .systemGray()
        return $0
    }(UILabel())
    private lazy var buttonRefresh: ButtonReload = {
        $0.addTarget(self, action: #selector(requestData), for: .touchUpInside)
        return $0
    }(ButtonReload())
    private(set) lazy var stackError: UIStackView = {
        let stack = UIStackView(arrangedSubviews:[
            buttonRefresh,
            labelError
        ])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .center
        return stack
    }()
    
    // MARK: - Life cycle
    
    init(viewModel: GalleriesViewModelProtocol) {
        super.init()
        
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindUI()
        setupUI()
        createElements()
        requestData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        collectionView.collectionViewLayout.invalidateLayout()
        refreshData()
    }
    
    // MARK: - Custom methods
    
    private func setupUI() {
        view.backgroundColor = .darkGray()
    }
    
    private func bindUI() {
        bindLoader()
        bindError()
    }
    
    private func createElements() {
        addButtonBack()
        addTitle()
        addTableView()
    }
    
    private func sizeGalley() -> CGSize {
        switch UIDevice.current.orientation {
        case .faceDown, .faceUp, .portrait, .portraitUpsideDown, .unknown:
            return .init(width: view.frame.width - CGFloat((ItemsPerPage.portrait.rawValue * 32)),
                         height: view.frame.width * 0.6)
        case .landscapeLeft, .landscapeRight:
            return .init(width: (view.frame.width / CGFloat(ItemsPerPage.landscape.rawValue)) - CGFloat((ItemsPerPage.landscape.rawValue * 32)),
                         height: view.frame.height * 0.6)
        @unknown default:
            return .zero
        }
    }
    
    // MARK: - Actions
    
    @objc func buttonBackPressed() {
        viewModel?.close()
    }
    
    @objc func requestData() {
        viewModel?.getData()
    }
    
    @objc func refreshData() {
        collectionView.stopLoading()
        collectionView.reloadData()
    }
}

// MARK: - Binds

extension GalleriesViewController {
    
    func bindLoader() {
        viewModel?.isLoading.bind { [weak self] isLoading in
            isLoading ? self?.collectionView.startLoading() : self?.refreshData()
        }
    }
    
    func bindError() {
        viewModel?.hasError.bind { [weak self] hasError in
            hasError ? self?.addError() : self?.stackError.removeFromSuperview()
        }
    }
}

// MARK: - Collection view datasource

extension GalleriesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.countGalleries() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GalleryCell.className, for: indexPath) as? GalleryCell,
            let viewModelCell = viewModel?.getGallery(index: indexPath.row)
        else { return UICollectionViewCell() }
        
        cell.configure(viewModel: viewModelCell)
        return cell
    }
}

// MARK: - Collection view flow delegate

extension GalleriesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        sizeGalley()
    }
}
