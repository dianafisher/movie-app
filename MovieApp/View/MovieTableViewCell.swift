//
//  MovieTableViewCell.swift
//  MovieApp
//
//  Created by Diana Fisher on 2/12/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit
import AFNetworking

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    var movie: Movie! {
        didSet {
            if let posterUrl = movie.posterURL {
                posterImageView.setImageWith(posterUrl)
            }
            titleLabel.text = movie.title
            overviewLabel.text = movie.overview
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
