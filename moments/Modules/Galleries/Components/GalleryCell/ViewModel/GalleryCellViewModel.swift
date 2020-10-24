//
//  GalleryCellViewModel.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

protocol GalleryCellViewModelProtocol {
    
    var isLoading: Dynamic<Bool> { get }
    var urlImage: Dynamic<String> { get }
    var hasError: Dynamic<Bool> { get }
    
    var countUps: Int { get }
    var countComments: Int { get }
    var countViews: Int { get }
    
    func loadImage()
}

final class GalleryCellViewModel: GalleryCellViewModelProtocol {
    
    // MARK: - Attributes
    
    private let service: GalleryCellServiceProtocol
    private let gallery: Gallery
    
    let isLoading = Dynamic<Bool>(false)
    let urlImage = Dynamic<String>("")
    let hasError = Dynamic<Bool>(false)
    
    var countUps: Int { gallery.ups ?? 0 }
    var countComments: Int { gallery.countComments ?? 0 }
    var countViews: Int { gallery.countViews ?? 0 }
    
    // MARK: - Life cycle
    
    init(gallery: Gallery, service: GalleryCellServiceProtocol = GalleryCellService()) {
        self.gallery = gallery
        self.service = service
    }
    
    // MARK: - Services
    
    func loadImage() {
        hasError.value = false
        isLoading.value = true
        
        guard urlImage.value.isEmpty else { return }
        
        service.getImage(hash: gallery.urlCover ?? "") { [weak self] response in
            switch response {
            case .success(let result):
                self?.urlImage.value = result?.data?.link ?? ""
            case .failure:
                self?.hasError.value = true
            }
            self?.isLoading.value = false
        }
    }
}
