//
//  HomeCoordinator.swift
//  moments
//
//  Created by Jader Borba Nunes on 22/10/20.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    // MARK: - Attributes
    
    private weak var navigation: UINavigationController?
    
    // MARK: - Life cycle
    
    init(presenter: UINavigationController) {
        navigation = presenter
    }
    
    // MARK: - Navigations
    
    func start() {
        let viewModel = HomeViewModel(coordinator: self)
        let viewController = HomeViewController(viewModel: viewModel)
        navigation?.viewControllers = [viewController]
    }
}
