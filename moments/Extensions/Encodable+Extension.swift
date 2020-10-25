//
//  Encodable+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation

extension Encodable {
    
    func toJson() -> [String: Any] {
        do {
            let jsonData = try JSONEncoder().encode(self)
            return try JSONSerialization.jsonObject(with: jsonData,
                                                    options: .allowFragments) as? [String: Any] ?? [:]
        } catch {
            return [:]
        }
    }
}
