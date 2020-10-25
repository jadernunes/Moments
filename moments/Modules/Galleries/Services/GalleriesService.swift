//
//  GalleriesService.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

protocol GalleriesServiceProtocol: AnyObject {
    typealias CompletionGalleries = ((Response<GalleryResult?>) -> Void)
    
    func getTopWeek(page: Int, completion: @escaping CompletionGalleries)
}

final class GalleriesService: GalleriesServiceProtocol {
    
    // MARK: - Attributes
    
    private let network = Network<GalleriesResources>()
    
    // MARK: - Requests
    
    func getTopWeek(page: Int, completion: @escaping CompletionGalleries) {
        let resource = GalleriesResources.requestTopWeek(page: page)
        network.makeRequest(request: resource, completion)
    }
}
