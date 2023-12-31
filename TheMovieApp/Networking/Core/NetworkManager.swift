//
//  NetworkManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import Foundation
import Alamofire

class NetworkManager {
    
    
    static func request<T: Codable>(model: T.Type,
                                    url: String,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                    completion: @escaping ((T?, String?)-> Void))  {
        
        AF.request(NetworkHelperLinker.baseUrl + url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: NetworkHelperLinker.header).responseDecodable(of: T.self) { response in
            print("-----\(NetworkHelperLinker.baseUrl + url)")
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
        
    }
}
