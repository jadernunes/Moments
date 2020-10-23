//
//  NSObject+Extension.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import Foundation

protocol ClassNameProtocol {
    static var className: String { get }
}

extension ClassNameProtocol {
    
    static var className: String {
        return String(describing: self)
    }
}

extension NSObject: ClassNameProtocol {}
