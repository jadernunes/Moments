//
//  FileDecoder.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation

struct FileDecoder {
    
    func decode<T: Decodable>(resource: JSONFiles) -> T? {
        let decoder = JSONDecoder()
        let bundle = Bundle.main

        guard
            let jsonUrl = bundle.url(forResource: resource.rawValue, withExtension: "json"),
            let jsonData = try? Data(contentsOf: jsonUrl),
            let response = try? decoder.decode(T.self, from: jsonData)
            else {
                debugPrint("Error on Json decoding")
            return nil
        }

        return response
    }
}
