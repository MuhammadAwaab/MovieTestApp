//
//  ListViewModel.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 27/02/2022.
//

import Foundation
import UIKit

protocol MainViewModelProtocol {
    func fetchParsedDataForDisplay()
    func getDataDisplayed(at indexPath: IndexPath) -> Results?
}

class MainViewModel: MainViewModelProtocol {
   
    private var currentProvider: DataProviderProtocol
    private let cellIdentifier = "MovieCell"
    unowned var parentController: UIViewController
    
    var movieListData: MovieList? {
        didSet{
            self.updateView?()
        }
    }
    
    lazy var router = {
            DetailRouter()
        }()
    
    var updateView:(() -> Void)?
    var showErrorAlertView:(() -> Void)?
    
    init(provider: DataProviderProtocol = DataProvider(), container: UIViewController = UIViewController()){
        self.currentProvider = provider
        parentController = container
    }
    
    func fetchParsedDataForDisplay() {
        self.currentProvider.fetchAndProvideListData { data in
            if let parsedData = data, let movieListArray = parsedData.results, movieListArray.count > 0 {
                self.movieListData = parsedData
            } else {
                self.showErrorAlertView?()
            }
        }
    }
    
    func getCellIdentifier() -> String {
        return self.cellIdentifier
    }
    
    func getDataDisplayed(at indexPath: IndexPath) -> Results? {
        if let movieData = movieListData, let resultsArray = movieData.results{
            return resultsArray[indexPath.row]
        } else {
            return nil
        }
    }
    
    func navigateToDetail(selectedCellIndex: IndexPath)  {
        if let movieData = movieListData, let resultsArray = movieData.results, let idToSend = resultsArray[selectedCellIndex.row].id {
            router.route(to: .showDetail, from: parentController, parameters: idToSend)
        }
    }
    
}
