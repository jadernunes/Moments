//
//  GalleriesViewModel.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

protocol GalleriesViewModelProtocol {
    func close()
}

final class GalleriesViewModel: GalleriesViewModelProtocol {
    
     // MARK: - Attributes
    
    private let coordinator: GalleriesCoordinatorProtocol?
    
    // MARK: - Life cycle
    
    init(coordinator: GalleriesCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    // MARK: - Navigations
    
    func close() {
        coordinator?.close()
    }
}
