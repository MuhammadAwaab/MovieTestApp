//
//  ViewController.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 18/02/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTableView: UITableView!

    lazy var viewModel = {
        MainViewModel(container: self)
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        bindWithViewModel()
    }

    func bindWithViewModel() {
       
        self.viewModel.updateView = {[weak self] in
            DispatchQueue.main.async {
                self?.mainTableView.reloadData()
            }
        }
        self.viewModel.fetchParsedDataForDisplay()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfCellsToShow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.getCellIdentifier(), for: indexPath) as! MovieListCell
        cell.resultObjectToDisplay = viewModel.getDataDisplayed(at: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        viewModel.navigateToDetail(selectedCellIndex: indexPath)
    }
    
}
