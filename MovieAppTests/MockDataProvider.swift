//
//  MockDataProvider.swift
//  MovieAppTests
//
//  Created by Muhammad Oneeb on 02/03/2022.
//

import Foundation


class MockDataProvider: DataProviderProtocol {
    func fetchAndProvideListData(completion: @escaping (MovieList?) -> Void) {
        if let path = Bundle.main.path(forResource: "MoviesAppSampleJson", ofType: "json") {
                  do {
                      let fileUrl = URL(fileURLWithPath: path)
                      // Getting data from JSON file using the file URL
                      let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                      let jsonDecoder = JSONDecoder()
                      let responseModel = try jsonDecoder.decode(MovieList.self, from: data)
                      completion(responseModel)
                  } catch {
                      // Handle error here
                      print("error parsing local json...")
                      completion(nil)
                  }
              }
    }
    
    func fetchMovieDetailWith(movieID: String, completion: @escaping (MovieDetail?) -> Void) {
        if let path = Bundle.main.path(forResource: "MovieDetailSampleJson", ofType: "json") {
                  do {
                      let fileUrl = URL(fileURLWithPath: path)
                      // Getting data from JSON file using the file URL
                      let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                      let jsonDecoder = JSONDecoder()
                      let responseModel = try jsonDecoder.decode(MovieDetail.self, from: data)
                      completion(responseModel)
                  } catch {
                      // Handle error here
                      print("error parsing local json...")
                      completion(nil)
                  }
              }
    }
    
    
}
