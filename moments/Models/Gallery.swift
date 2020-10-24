//
//  Gallery.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

struct Gallery: Decodable {
    
    var countComments: Int?
    var urlCover: String?
    var countViews: Int?
    var ups: Int?
    
    private enum CodingKeys: String, CodingKey {
        case
            ups,
            countComments = "comment_count",
            urlCover = "cover",
            countViews = "views"
    }
}
