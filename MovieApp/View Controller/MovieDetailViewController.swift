//
//  MovieDetailViewController.swift
//  MovieApp
//
//  Created by Diana Fisher on 2/12/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var backdropImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if movie != nil {
            titleLabel.text = movie?.title
            if let backdropImageUrl = movie?.backdropURL {
                backdropImage.setImageWith(backdropImageUrl)
            }            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
