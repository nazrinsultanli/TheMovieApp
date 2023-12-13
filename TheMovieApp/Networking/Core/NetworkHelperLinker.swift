//
//  NetworkHelperLinker.swift
//  TheMovieApp
//
//  Created by Nazrin Sultanlı on 08.12.23.
//

import Foundation
import Alamofire

class NetworkHelperLinker {
    static var baseUrl = "https://api.themoviedb.org/3/"
    static var header: HTTPHeaders = ["Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0MTUwNjA1ZTFlN2VjMjIwNGIxNTY1MWY1M2U0MGJhNiIsInN1YiI6IjY1NmFlODhjMDg1OWI0MDBlMjljNTlhZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.eSz9MCMVPVo8GayUWnTMepwJi984G15t3ceT_v2kWMA",
                                      "accept":"application/json"]
    static var imagePath = "https://image.tmdb.org/t/p/original/"
}
