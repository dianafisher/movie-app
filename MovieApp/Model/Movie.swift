//
//  Movie.swift
//  MovieApp
//
//  Created by Diana Fisher on 2/9/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//


import Foundation

class Movie {
    var id: String?
    var video: Bool
    var title: String = ""
    var genreIds: [Int] = []
    var backdropURL: URL?
    var overview: String = ""
    var releaseDate: Date?
    var originalLanguage: String?
    var lowResPosterURL: URL?
    var posterURL: URL?
    
    fileprivate let lowResBaseUrl = "http://image.tmdb.org/t/p/w154"    // 154 x 231
    fileprivate let baseUrl = "http://image.tmdb.org/t/p/w500"          // 500 x 750
    fileprivate let lowResBackdropBaseUrl = "http://image.tmdb.org/t/p/w300"  // 300 x 169
    fileprivate let backdropBaseUrl = "http://image.tmdb.org/t/p/w300"  // 780 x 439
    
    init(from: [String: Any]) {
        
        id = from["id"] as? String
        if let videoValue = from["video"] as? Int {
            video = videoValue == 0 ? false : true
        } else {
            video = false
        }
        title = from["title"] as? String ?? "No title available"
        if let posterPath = from["poster_path"] as? String {
            posterURL = URL(string: baseUrl + posterPath)
            lowResPosterURL = URL(string: lowResBaseUrl + posterPath)
        }
        genreIds = from["genre_ids"] as! [Int]
        if let backdropPath = from["backdrop_path"] as? String {
            backdropURL = URL(string: backdropBaseUrl + backdropPath)
            print("backdropURL:\(backdropURL)")
        }
        overview = from["overview"] as? String ?? "No overview available"
        if let releaseDateString = from["release_date"] as? String {
            releaseDate = Date()  /// TODO: Parse the date!
            print("PLEASE PARSE ME: \(releaseDateString)")
        }
        originalLanguage = from["original_language"] as? String
        
    }
}
