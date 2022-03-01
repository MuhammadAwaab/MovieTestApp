//
//  MovieServices.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 27/02/2022.
//

import Foundation


let dataFetchUrl = "https://api.themoviedb.org/3/discover/movie?api_key=c9856d0cb57c3f14bf75bdc6c063b8f3"

let apiKey = "c9856d0cb57c3f14bf75bdc6c063b8f3"


enum MovieServices {
    case fetchMoviesListData
    case movieDetail(movieID: String)
}


extension MovieServices: Service {
    var baseURL: String {
        return "https://api.themoviedb.org"
    }
    
    var path: String {
        switch self {
        case .fetchMoviesListData:
            return "/3/discover/movie"

        case .movieDetail(let movieID):
            return "/3/movie/" + movieID
        }
    }
    
    var parameters: [String: Any]? {
        // default params
        var params: [String: Any] = [:]
        params["api_key"] = apiKey
        
        return params
    }
    
    var method: ServiceMethod {
        return .get
    }
}
