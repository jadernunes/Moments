//
//  GalleriesCoordinator.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import UIKit

protocol GalleriesCoordinatorProtocol {
    func close()
}

final class GalleriesCoordinator: Coordinator {
    
    // MARK: - Attributes
    
    private weak var navigation: UINavigationController?
    
    // MARK: - Life cycle
    
    init(presenter: UINavigationController) {
        navigation = presenter
    }
    
    // MARK: - Navigations
    
    func start() {
        let viewModel = GalleriesViewModel(coordinator: self)
        let viewController = GalleriesViewController(viewModel: viewModel)
        navigation?.pushViewController(viewController, animated: true)
    }
}

// MARK: - Home coordinator

extension GalleriesCoordinator: GalleriesCoordinatorProtocol {
    
    func close() {
        navigation?.popViewController(animated: true)
    }
}
