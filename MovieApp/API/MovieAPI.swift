//
//  MovieAPI.swift
//  MovieApp
//
//  Created by Diana Fisher on 2/9/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import Foundation

let apiKey:String = "9c8b8a24a248fed2e25eb1f8d2f29d13"
let endpoint: String = "now_playing"

enum MovieApiError: Error {
    case urlUnwrapping
    case dataUnwrapping
}

class MovieAPI: NSObject {
    
    var totalPages = 1
    var totalResults = 1
    
    func fetchMovies( completion: @escaping( _ success: Bool, _ movies: [Movie], _ error: Error? ) ->() ) {
        
        let session = URLSession(
            configuration: URLSessionConfiguration.default,
            delegate:nil,
            delegateQueue:OperationQueue.main
        )
        guard let url = URL(string:"https://api.themoviedb.org/3/movie/\(endpoint)?api_key=\(apiKey)") else
        {
            print("Error unwrapping URL")            
            completion(false, [], MovieApiError.urlUnwrapping)
            return
        }
        
        let dataTask: URLSessionDataTask = session.dataTask(with: url) { [weak self](data, response, error) in
            if error != nil {
                completion(false, [], error)
            } else {
                guard let unwrappedData = data else {
                    print("Error unwrapping data")
                    completion(false, [], MovieApiError.dataUnwrapping)
                    return
                }
                
                if let responseDict = try! JSONSerialization.jsonObject(with: unwrappedData, options: []) as? NSDictionary {
                    print("responseDict: \(responseDict)")
                    guard let strongSelf = self else {
                        return
                    }
                    let results = responseDict["results"] as! [[String: Any]]
                    strongSelf.totalResults = responseDict["total_results"] as! Int
                    strongSelf.totalPages = responseDict["total_pages"] as! Int
                    
//                    print("results: \(results)")
                    var movies: [Movie] = []
                    for dict in results {
                        let m = Movie(from: dict)
                        movies.append(m)
                    }
                    
                    completion(true, movies, nil)
                }
                
            }
        }
        dataTask.resume()
    }
}
