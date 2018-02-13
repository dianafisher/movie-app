//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Diana Fisher on 2/12/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    let MOVIE_CELL_REUSE_IDENTIFIER = "MovieTableViewCell"
    let viewModel: MovieListViewModel = MovieListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel.loadMovies { (success, error) in
            if (success) {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
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

extension MovieListViewController : UITableViewDelegate {
    
}

extension MovieListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MOVIE_CELL_REUSE_IDENTIFIER, for: indexPath) as! MovieTableViewCell
        let movie = viewModel.movieAt(indexPath: indexPath)
        cell.movie = movie
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
}
