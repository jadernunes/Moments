//
//  GalleriesResources.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Alamofire

enum GalleriesResources {
    case requestTopWeek(page: Int)
    case requestImage(hash: String)
}

extension GalleriesResources: Requestable {
    
    var method: HTTPMethod { .get }
    
    var path: String {
        switch self {
        case .requestTopWeek(let page):
            return "/gallery/top/week/\(page)"
        case .requestImage(let hash):
            return "/image/\(hash)"
        }
    }
}
