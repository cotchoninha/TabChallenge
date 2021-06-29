//
//  NetworkOperationsTests.swift
//  TabChallengeTests
//
//  Created by Spare on 01/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import XCTest
@testable import TabChallenge

class NetworkOperationsTests: XCTestCase {
    
    let apiURL = URL(string: "https://www.test.com")!
    var mockURLSession: MockURLSession!
    var subject: NetworkOperations!
    let data = HelperClass.caseStudiesJson.data(using: .utf8)!
    
    override func setUp() {
        mockURLSession = MockURLSession(dataResponse: .success(data))
        subject = NetworkOperations(session: mockURLSession)
    }
    
    func test_requestCaseStudies_success() {
//        let expectation = self.expectation(description: #function)
//        subject.requestCaseStudies(completionHandler: { result in
//            switch result {
//            case .success(let projects):
//                XCTAssertEqual(projects, HelperClass.createMockReponse())
//            case .failure(_):
//                break
//            }
//            expectation.fulfill()
//        })
//        
//        // Then
//        wait(for: [expectation], timeout: 1.0)
    }
    
    func test_requestCaseStudies_failure() {
        // Given
//        let expectation = self.expectation(description: #function)
//        // setar o mock URLSessionType pra failure
//        // When
//        subject.requestCaseStudies { (projects, error) in
//            guard error != nil else { return XCTFail(#function) }
//            expectation.fulfill()
//            let eenum = Enum.a
//            guard case .a = eenum else { return XCTFail(#function) }
//
//        }
//        // Then
//        wait(for: [expectation], timeout: 1.0)
    }
}


class MockURLSession: URLSessionType {
    
     enum ErrorResponse: Error {
           case error
       }
       
       enum DataResponse {
           case success(Data)
           case error(ErrorResponse)
       }
    
       private let dataResponse: DataResponse
       
       init(dataResponse: DataResponse) {
           self.dataResponse = dataResponse
       }
    
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        switch dataResponse {
        case .success(let data):
            completionHandler(data, nil, nil)
        case .error(let error):
            completionHandler(nil, nil, error)
        }
        return URLSessionDataTask()
    }
}
