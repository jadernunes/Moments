//
//  GalleriesViewModel.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

protocol GalleriesViewModelProtocol {
    
    var isLoading: Dynamic<Bool> { get }
    
    func close()
    func getData()
    func countGalleries() -> Int
    func getGallery(index: Int) -> Gallery?
}

final class GalleriesViewModel: GalleriesViewModelProtocol {
    
     // MARK: - Attributes
    
    private let coordinator: GalleriesCoordinatorProtocol?
    private let service: GalleriesServiceProtocol
    private var galleries = [Gallery]()
    
    let isLoading = Dynamic<Bool>(false)
    
    // MARK: - Life cycle
    
    init(coordinator: GalleriesCoordinatorProtocol? = nil, service: GalleriesServiceProtocol = GalleriesService()) {
        self.coordinator = coordinator
        self.service = service
    }
    
    // MARK: - Services
    
    func getData() {
        isLoading.value = true
        service.getTopWeek(page: 1) { [weak self] response in
            switch response {
            case .success(let result):
                self?.galleries.append(contentsOf: result?.data ?? [])
            case .failure:
                break //TODO: - Show error
            }
            self?.isLoading.value = false
        }
    }
    
    // MARK: - Navigations
    
    func close() {
        coordinator?.close()
    }
    
    // MARK: - Custom methods
    
    func countGalleries() -> Int {
        galleries.count
    }
    
    func getGallery(index: Int) -> Gallery? {
        galleries[safe: index]
    }
}
