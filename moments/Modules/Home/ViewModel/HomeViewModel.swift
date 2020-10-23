//
//  HomeViewModel.swift
//  moments
//
//  Created by Jader Borba Nunes on 22/10/20.
//

protocol HomeViewModelProtocol {

    func countFlows() -> Int
    func getFlow(index: Int) -> Flow?
}

final class HomeViewModel: HomeViewModelProtocol {
    
     // MARK: - Attributes
    
    private let coordinator: Coordinator?
    private var flows = [
        Flow(title: "Home with pull refresh success"),
        Flow(title: "Image download error"),
        Flow(title: "Home empty error"),
        Flow(title: "Landscape Mode")
    ]
    
    // MARK: - Life cycle
    
    init(coordinator: Coordinator? = nil) {
        self.coordinator = coordinator
    }
    
    // MARK: - Custom methods
    
    func countFlows() -> Int {
        flows.count
    }
    
    func getFlow(index: Int) -> Flow? {
        flows[safe: index]
    }
}
