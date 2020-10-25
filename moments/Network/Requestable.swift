//
//  Requestable.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation
import Alamofire

protocol Requestable: URLRequestConvertible {
    
    var baseURL: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var path: String { get }
    var authorization: String? { get }
    
    func asURLRequest() throws -> URLRequest
    func getDecoder() -> JSONDecoder
}

extension Requestable {
    
    var authorization: String? { Config().accessToken }
    var parameters: Parameters? { nil }
    var baseURL: String { Config().baseURL }
    
    func asURLRequest() throws -> URLRequest {
        
        guard let url = URL(string: baseURL) else {
            throw AFError.parameterEncodingFailed(reason: .missingURL)
        }
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        urlRequest.setValue(ContentType.json.rawValue,
                            forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        urlRequest.setValue(authorization,
                            forHTTPHeaderField: HTTPHeaderField.authentication.rawValue)
        
        if let parameters = parameters {
            do {
                switch method {
                case .get:
                    urlRequest = try URLEncoding.default.encode(urlRequest, with: parameters)
                case .post, .patch:
                    urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
                default:
                    break
                }
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        return urlRequest
    }
    
    func getDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }
}
