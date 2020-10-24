//
//  HomeViewModel.swift
//  moments
//
//  Created by Jader Borba Nunes on 22/10/20.
//

protocol HomeViewModelProtocol {

    func countFlows() -> Int
    func getFlow(index: Int) -> Flow?
    func openGalleries()
}

final class HomeViewModel: HomeViewModelProtocol {
    
     // MARK: - Attributes
    
    private let coordinator: HomeCoordinatorProtocol?
    private var flows = [
        Flow(title: "Home with pull refresh success"),
        Flow(title: "Image download error"),
        Flow(title: "Home empty error"),
        Flow(title: "Landscape Mode")
    ]
    
    // MARK: - Life cycle
    
    init(coordinator: HomeCoordinatorProtocol? = nil) {
        self.coordinator = coordinator
    }
    
    // MARK: - Navigations
    
    func openGalleries() {
        coordinator?.openGalleries()
    }
    
    // MARK: - Custom methods
    
    func countFlows() -> Int {
        flows.count
    }
    
    func getFlow(index: Int) -> Flow? {
        flows[safe: index]
    }
}
