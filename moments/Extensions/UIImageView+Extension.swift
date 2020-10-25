//
//  UIImageView+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    @discardableResult func addImage(path: String? = nil, _ completion: (() -> Void)? = nil) -> UIImageView {
        DispatchQueue.main.async { [weak self] in
            let processor = DownsamplingImageProcessor(size: self?.frame.size ?? CGSize())
            let url = URL(string: (path ?? ""))
            self?.kf.indicatorType = .activity
            self?.kf.setImage(
                with: url,
                options: [
                    .processor(processor),
                    .transition(.fade(0.5)),
                    .scaleFactor(UIScreen.main.scale),
                    .cacheOriginalImage
                ], completionHandler: { [weak self] result in
                    self?.populateImage(result)
                    completion?()
                })
        }
        return self
    }
    
    private func populateImage(_ result: Result<RetrieveImageResult, KingfisherError>) {
        var noImage = true
        if case .success(let value) = result {
            noImage = (value.image.cgImage?.bytesPerRow ?? 0) == 0
        }
        
        if noImage {
            image = UIImage(named: "...") //TODO: - Add general placeholder
        }
    }
}
