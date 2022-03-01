//
//  MovieListCell.swift
//  MovieApp
//
//  Created by Muhammad Oneeb on 27/02/2022.
//

import UIKit
import Kingfisher

class MovieListCell: UITableViewCell {

    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieDateLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    
    var resultObjectToDisplay: Results? {
        didSet {
            movieTitleLabel.text = resultObjectToDisplay?.original_title ?? "N/A"
            movieDateLabel.text = resultObjectToDisplay?.release_date ?? "N/A"
            if let imagePath = resultObjectToDisplay?.poster_path, let imageURL = imagePath.getPosterImageURL() {
                posterImageView.kf.setImage(with: imageURL)
            }

        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension String {
    func getPosterImageURL() -> URL? {
        let urlString = "https://image.tmdb.org/t/p/w500/" + self
        return URL(string: urlString)
    }
}

