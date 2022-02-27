//
//  ViewController.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 18/02/2022.
//

import UIKit

class ViewController: UIViewController {

    lazy var viewModel = {
        MainViewModel(container: self)
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

