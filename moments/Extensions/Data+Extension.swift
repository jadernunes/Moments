//
//  Data+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation

extension Data {
    
    public func decode<T: Decodable>() -> T? {
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: self)
        } catch {
            return nil
        }
    }
}
