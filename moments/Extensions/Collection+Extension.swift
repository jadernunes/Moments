//
//  Collection+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import Foundation

extension Collection {
    
    /// Returns the element at the specified index if it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
