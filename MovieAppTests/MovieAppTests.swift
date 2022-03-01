//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Muhammad Oneeb on 18/02/2022.
//

import XCTest
@testable import MovieApp

class MovieAppTests: XCTestCase {
    
    var mockProvider: DataProviderProtocol?
    var listModelToTest: MainViewModelProtocol?

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        
        listModelToTest?.fetchParsedDataForDisplay()
        
        let movieListObject = listModelToTest?.getDataDisplayed(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(movieListObject)

        let movieListSecondObject = listModelToTest?.getDataDisplayed(at: IndexPath(row: 1, section: 0))
        XCTAssertTrue(movieListSecondObject?.original_title == "Scream")
        XCTAssertTrue(movieListSecondObject?.original_language == "en")
        
        
    }

    
    override func setUp() {
        mockProvider = MockDataProvider()
        listModelToTest = MainViewModel(provider: mockProvider!)
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
