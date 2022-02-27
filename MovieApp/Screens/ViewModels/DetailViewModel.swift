//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 27/02/2022.
//

import Foundation


protocol DetailViewModelProtocol {
    func fetchParsedDataForDisplay()
}

class DetailViewModel: DetailViewModelProtocol {
    
    private var currentProvider: DataProviderProtocol
    private let currentMovieID: String
    
    var movieDetailData: MovieDetail? {
        didSet{
            self.updateView?()
        }
    }
    
    var updateView:(() -> Void)?
    var showErrorAlertView:(() -> Void)?
    
    init(provider: DataProviderProtocol = DataProvider(), idToDisplay: String){
        self.currentProvider = provider
        self.currentMovieID = idToDisplay
    }
    
    func fetchParsedDataForDisplay() {
        self.currentProvider.fetchMovieDetailWith(movieID: currentMovieID) { data in
            if let parsedData = data {
                self.movieDetailData = parsedData
            } else {
                self.showErrorAlertView?()
            }
        }
        
    }
    
}
