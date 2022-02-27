//
//  AppRouter.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 27/02/2022.
//

import Foundation
import UIKit

protocol Router {
   func route(to routeID: Pathway, from context: UIViewController, parameters: Any?)
}

enum Pathway: String {
      case showDetail
}


class DetailRouter: Router {
    func route(to routeID: Pathway, from context: UIViewController, parameters: Any?) {
        if routeID == .showDetail {
            let next = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
            
            if let stringToPass = parameters as? String {
                let detailViewModel = DetailViewModel(idToDisplay: stringToPass)
                next.viewModel = detailViewModel
                context.navigationController?.pushViewController(next, animated: true)
            }
        }
    }
    
}
