//
//  Dynamic.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import Foundation

final class Dynamic<T> {
    typealias Listener = (T) -> Void
    
    // MARK: - Attributes
    
    var listener: Listener?
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    // MARK: - Life cycle
    
    init(_ v: T) {
        value = v
    }
    
    // MARK: - Custom methods
    
    func bind(_ listener: Listener?) {
        self.listener = listener
    }
    
    func bindAndFire(_ listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func fire() {
        listener?(value)
    }
}
