//
//  FlowCellViewModel.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import Foundation

protocol FlowCellViewModelProtocol {
    
    var flow: Flow { get }
}

final class FlowCellViewModel: FlowCellViewModelProtocol {
    
    // MARK: - Attributes
    
    var flow: Flow
    
    // MARK: - Life cycle
    
    init(flow: Flow) {
        self.flow = flow
    }
}
