//
//  DataProvider.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 27/02/2022.
//

import Foundation


protocol DataProviderProtocol {
    func fetchAndProvideListData(completion: @escaping(_ serverData: MovieList?) -> Void)
    func fetchMovieDetailWith(movieID: String, completion: @escaping(_ serverData: MovieDetail?) -> Void)
}

class DataProvider: DataProviderProtocol {
    
    let provider = ServiceProvider<MovieServices>()

    
    func fetchAndProvideListData(completion: @escaping (MovieList?) -> Void) {
        provider.load(service: .fetchMoviesListData) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(MovieList.self, from: data)
                    completion(responseModel)
                } catch  {
                    print("Serialization invalid error....")
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .empty:
                print("No data")
                completion(nil)
            }
        }
    }
    
    func fetchMovieDetailWith(movieID: String, completion: @escaping (MovieDetail?) -> Void) {
        provider.load(service: .movieDetail(movieID: movieID)) { result in
            switch result {
            case .success(let data):
                do {
                    let jsonDecoder = JSONDecoder()
                    let responseModel = try jsonDecoder.decode(MovieDetail.self, from: data)
                    completion(responseModel)
                } catch  {
                    print("Serialization invalid error....")
                    completion(nil)
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(nil)
            case .empty:
                print("No data")
                completion(nil)
            }
        }
    }
    
}

