//
//  GalleryCellService.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

protocol GalleryCellServiceProtocol: AnyObject {
    typealias CompletionImage = ((Response<ImageResult?>) -> Void)
    
    func getImage(hash: String, completion: @escaping CompletionImage)
}

final class GalleryCellService: GalleryCellServiceProtocol {
    
    // MARK: - Attributes
    
    private let network = Network<GalleriesResources>()
    
    // MARK: - Requests
    
    func getImage(hash: String, completion: @escaping CompletionImage) {
        let resource = GalleriesResources.requestImage(hash: hash)
        network.makeRequest(request: resource, completion)
    }
}
