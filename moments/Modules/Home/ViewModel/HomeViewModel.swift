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
        Flow(title: .localizable("flowSuccess")),
        Flow(title: .localizable("flowImageError")),
        Flow(title: .localizable("flowListError")),
        Flow(title: .localizable("flowLandscape"))
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
