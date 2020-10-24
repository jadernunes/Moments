//
//  Network.swift
//  moments
//
//  Created by Jader Borba Nunes on 24/10/20.
//

import Foundation
import Alamofire

enum Response<T> {
    case success(T)
    case failure(error: ErrorCustom, statusCode: HTTPStatusCode? = nil)
}

enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
}

enum ContentType: String {
    case json = "application/json"
}

final class Network<R: Requestable> {
    
    // MARK: - Attributes
    
    lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return decoder
    }()
    
    // MARK: - Custom methods
    
    func makeRequest<T: Decodable>(request: R, _ completion: @escaping ((Response<T>) -> Void)) {
        if Reachability.isConnectedToNetwork() {
            printRequest(request: request)
            AF.request(request)
                .validate()
                .responseDecodable(
                    queue: DispatchQueue.global(qos: .background),
                    decoder: decoder) { (response: DataResponse<T, AFError>) in
                        DispatchQueue.main.async { [weak self] in
                            let statusCode = HTTPStatusCode(rawValue: response.response?.statusCode ?? -1)
                            switch response.result {
                            case .success(let value):
                                self?.printResponse(response)
                                completion(.success(value))
                            case .failure(let error):
                                let err = AFError.responseSerializationFailed(reason: .inputDataNilOrZeroLength)
                                guard
                                    error.localizedDescription == err.localizedDescription
                                    else {
                                    self?.printResponse(response)
                                        
                                        switch statusCode {
                                        case .unauthorized:
                                            completion(.failure(error: .authentication, statusCode: statusCode))
                                        default:
                                            if (response.error as NSError?)?.code != NSURLErrorCancelled {
                                                completion(.failure(error: .generic(response.data), statusCode: statusCode))
                                            } else {
                                                //TODO: Send the error to crashlytics
                                            }
                                        }
                                        
                                        return
                                }
                                
                                completion(.failure(error: .generic()))
                            }
                        }
            }
        } else {
            completion(.failure(error: .noInternet))
        }
    }
    
    // MARK: - Debug prints

    private func printRequest(request: Requestable?) {
        #if DEBUG
        print("\n\n**********  REQUEST   **************")
        print("\(request?.urlRequest?.httpMethod ?? "") - URL: ", request?.urlRequest?.url ?? "")
        print("HEADER: ", request?.urlRequest?.allHTTPHeaderFields?.toJson() ?? "")
        print("BODY: ", request?.parameters ?? "")
        print("****************************************\n\n")
        #endif
    }

    private func printResponse<T: Decodable>(_ response: DataResponse<T, AFError>) {
        #if DEBUG
        print("\n\n**********  RESPONSE   **************")
        
        let statusCode = response.response?.statusCode ?? -1
        let httpMethod = response.request?.httpMethod ?? ""
        let url = response.request?.description ?? ""
        
        print("STATUS_CODE: \(statusCode) - \(httpMethod) - URL: ", url)
        
        do {
            if let json = try JSONSerialization.jsonObject(with: response.data ?? Data(), options: []) as? [String: Any] {
                print("RESULT: \(json)")
            } else if let json = try JSONSerialization.jsonObject(with: response.data ?? Data(), options: []) as? [[String: Any]] {
                print("RESULT: \(json)")
            }
        } catch let error as NSError {
            print("Failed to parse Result: \(error.localizedDescription)")
        }
        
        print("****************************************\n\n")
        #endif
    }
}
