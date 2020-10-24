//
//  GalleriesViewController.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import UIKit

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
        
        setupUI()
        createElements()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    // MARK: - Custom methods
    
    private func setupUI() {
        view.backgroundColor = .darkGray()
    }
    
    private func createElements() {
        addButtonBack()
        addTitle()
    }
    
    // MARK: - Actions
    
    @objc func buttonBackPressed() {
        viewModel?.close()
    }
}
