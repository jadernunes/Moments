//
//  GalleriesStub.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation

final class GalleriesStubSuccess: GalleriesServiceProtocol {
    
    // MARK: - Attributes
    
    private let mock = Mocks()
    
    // MARK: - Responses
    
    func getTopWeek(page: Int, completion: @escaping CompletionGalleries) {
        completion(.success(mock.galleries()))
    }
}

final class GalleriesStubFail: GalleriesServiceProtocol {
    
    // MARK: - Attributes
    
    private let mock = Mocks()
    
    // MARK: - Responses
    
    func getTopWeek(page: Int, completion: @escaping CompletionGalleries) {
        completion(.failure(error: .generic()))
    }
}
