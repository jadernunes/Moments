//
//  String+Extesion.swift
//  moments
//
//  Created by Jader Borba Nunes on 23/10/20.
//

import Foundation

extension String {
    
    public static func localizable(_ key: String) -> String {
        let textLocalised = NSLocalizedString(key, comment: "")
        return key == textLocalised ? "" : textLocalised
    }
}
