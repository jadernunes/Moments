//
//  GalleriesViewModel.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

protocol GalleriesViewModelProtocol {
    
    var isLoading: Dynamic<Bool> { get }
    var hasError: Dynamic<Bool> { get }
    
    func close()
    func getData()
    func countGalleries() -> Int
    func getGallery(index: Int) -> GalleryCellViewModel?
}

final class GalleriesViewModel: GalleriesViewModelProtocol {
    
     // MARK: - Attributes
    
    private let coordinator: GalleriesCoordinatorProtocol?
    private let service: GalleriesServiceProtocol
    private var galleries = [GalleryCellViewModel]()
    
    let isLoading = Dynamic<Bool>(false)
    let hasError = Dynamic<Bool>(false)
    
    // MARK: - Life cycle
    
    init(coordinator: GalleriesCoordinatorProtocol? = nil, service: GalleriesServiceProtocol = GalleriesService()) {
        self.coordinator = coordinator
        self.service = service
    }
    
    // MARK: - Services
    
    func getData() {
        isLoading.value = true
        hasError.value = false
        
        //TODO: - Create logic to request by page
        service.getTopWeek(page: 1) { [weak self] response in
            switch response {
            case .success(let result):
                self?.galleries.append(contentsOf: result?.data?.map({ GalleryCellViewModel(gallery: $0) }) ?? [])
            case .failure:
                self?.hasError.value = true
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
    
    func getGallery(index: Int) -> GalleryCellViewModel? {
        galleries[safe: index]
    }
}
