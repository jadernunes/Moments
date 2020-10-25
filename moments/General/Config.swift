//
//  Config.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation

// MARK: - Config.plist Entries

final class Config {
    
    // MARK: - Attributes
    
    lazy var baseURL: String = {
        return configKey(key: "baseURL")
    }()
    
    lazy var clientID: String = {
        return configKey(key: "clientID")
    }()
    
    lazy var accessToken: String = {
        return configKey(key: "accessToken")
    }()
    
    // MARK: - Custom methods
    
    private func configKey(key: String) -> String {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist"),
            let dictionary = NSDictionary(contentsOfFile: path) as? [String: Any],
            let value = dictionary[key] as? String else {
                return ""
        }
        return value
    }
}
