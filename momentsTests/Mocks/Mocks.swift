//
//  Mocks.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation

enum JSONFiles: String {
    case galleries
}

final class Mocks {
    
    // MARK: - Attributes
    
    private let decoder = FileDecoder()
    
    // MARK: - Responses
    
    func galleries() -> GalleryResult? {
        decoder.decode(resource: .galleries)
    }
}
