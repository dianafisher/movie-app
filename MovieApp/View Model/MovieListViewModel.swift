//
//  MovieListViewModel.swift
//  MovieApp
//
//  Created by Diana Fisher on 2/12/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import UIKit

class MovieListViewModel: NSObject {
    
    var movies: [Movie]
    let movieAPI: MovieAPI = MovieAPI()
    
    override init() {
        movies = []
    }
    
    func loadMovies(completion: @escaping( _ success: Bool, _ error: Error? ) ->()) {
        
        movieAPI.fetchMovies { (success, movies, error) in
            if (success) {
                print("\(movies.count)")
                self.movies = movies
                completion(true, nil)
            } else {                
                completion(false, error)
            }
        }
    }
    
    //MARK: Data Source
    
    func numberOfRowsInSection() -> Int {
        return movies.count
    }
    
    func movieAt(indexPath: IndexPath) -> Movie {
        return movies[indexPath.row]
    }
}
