//
//  NetworkManager.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 02.12.23.
//

import Foundation
import Alamofire

class NetworkManager {
    static var baseUrl = "https://api.themoviedb.org/3/"
    static var header: HTTPHeaders = ["" : ""]
    
    static func request<T: Codable>(model: T.Type,
                                    url: String,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                    completion: @escaping ((T?, String?)-> Void))  {
        
        AF.request(baseUrl + url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: header).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
        
    }
}


