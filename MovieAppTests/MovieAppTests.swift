//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Diana Fisher on 2/9/18.
//  Copyright © 2018 Diana Fisher. All rights reserved.
//

import XCTest
@testable import MovieApp

class MovieAppTests: XCTestCase {
    
    var movieAPI: MovieAPI!
    
    override func setUp() {
        super.setUp()
        movieAPI = MovieAPI()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        movieAPI = nil
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        movieAPI.fetchMovies { (success, movies, error) in
            
            XCTAssertTrue(success)
            XCTAssertNotEqual(movies.count, 0)
            XCTAssertNil(error)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
