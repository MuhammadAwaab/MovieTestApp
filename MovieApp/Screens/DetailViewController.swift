//
//  DetailViewController.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 27/02/2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var viewModel: DetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bindWithViewModel()
    }
    
    func bindWithViewModel() {
       
        self.viewModel?.updateView = {[weak self] in
                DispatchQueue.main.async {
                    self?.movieTitleLabel.text = self?.viewModel?.movieDetailData?.original_title ?? "N/A"
                    self?.movieDateLabel.text = self?.viewModel?.movieDetailData?.release_date ?? "N/A"
                    self?.descriptionTextView.text = self?.viewModel?.movieDetailData?.overview ?? "N/A"
                    
                    if let imagePath = self?.viewModel?.movieDetailData?.poster_path, let imageURL = imagePath.getPosterImageURL() {
                        self?.posterImageView.kf.setImage(with: imageURL)
                    }
                    
                }
            }
        self.viewModel?.fetchParsedDataForDisplay()
        
    }

}
