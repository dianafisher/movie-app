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
    let DETAILS_SEGUE = "DetailsSegue"
    
    let viewModel: MovieListViewModel = MovieListViewModel()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        // Set navigationBar tint colors
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        
        navigationItem.title = "Now Playing"

        viewModel.loadConfig()
        
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
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        if view.frame.width > view.frame.height {
            // in landscape orientation
            print("landscape orientation")
        } else {
            // in portrait orientation
            print("portrait orientation")
        }
    }       

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == DETAILS_SEGUE {
            let detailsVC = segue.destination as! MovieDetailViewController
            let cell = sender as! UITableViewCell
            let indexPath = tableView.indexPath(for: cell)
            let movie = viewModel.movieAt(indexPath: indexPath!)
            detailsVC.movie = movie
        }
    }
    

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
