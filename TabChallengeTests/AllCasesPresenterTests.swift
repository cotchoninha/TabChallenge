//
//  AllCasesPresenterTests.swift
//  TabChallengeTests
//
//  Created by Spare on 17/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import XCTest
@testable import TabChallenge

class AllCasesPresenterTests: XCTestCase {
    
    var presenter: AllCasesPresenter!
    var mockNetworkOperations: MockNetworkOperations!

    override func setUp() {
        mockNetworkOperations = MockNetworkOperations(projectsResponse: .successReponse(HelperClass.createMockReponse()))
        presenter = AllCasesPresenter(networkOperations: mockNetworkOperations)
    }

    func test_loadCaseStudies_withSuccessResponse() {
        presenter.loadCaseStudies()
        let viewModel = presenter.getViewModels()
        let expectedViewModel = createMockAllCasesViewModel()
        XCTAssertEqual(viewModel, expectedViewModel)
    }
    
    func test_loadCaseStudies_withErrorResponse() {
        mockNetworkOperations = MockNetworkOperations(projectsResponse: .error(.error))
        presenter = AllCasesPresenter(networkOperations: mockNetworkOperations)
        let viewModel = presenter.getViewModels()
        XCTAssertEqual(viewModel, [])
    }

    //MARK: Helper
    
    func createMockAllCasesViewModel() -> [AllCasesViewModel] {
        return [AllCasesViewModel(clientName: "TfL", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_header-image-2x.jpg", teaser: "Testing Tube brakes, with TfL Decelerator"), AllCasesViewModel(clientName: "Rail Delivery Group", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/rdg_hero_image_1400x520-x2.png", teaser: "Taking national Railcards from wallet to smartphone"), AllCasesViewModel(clientName: "Met Office", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/metoffice_hero_image-2x.jpg", teaser: "Rebuilding essential weather services"), AllCasesViewModel(clientName: "Tesco", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/tab_tesco_hero-2x.png", teaser: "Delivering market-leading convenience with Tesco Now"), AllCasesViewModel(clientName: "The Telegraph", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/tab_telegraph_hero-2x.png", teaser: "Driving best practice delivery"), AllCasesViewModel(clientName: "Unilever", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/oneview-hero-2x.jpg", teaser: "Enabling smart, fast decisions inside global giant Unilever"), AllCasesViewModel(clientName: "Maplin", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/maplin_hero-2x.png", teaser: "Reinventing the in-store experience"), AllCasesViewModel(clientName: "M&S", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/cs_ms_hero_image-2x.jpg", teaser: "Building a new payments experience for a high street icon"), AllCasesViewModel(clientName: "Ford", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/cs-ford-hero-image-web.jpg", teaser: "Exploring the future of urban car use"), AllCasesViewModel(clientName: "", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/fs_hero_image-2x.png", teaser: "Reimagining financial services in a post-plastic world")]
    }
}

class MockNetworkOperations: NetworkOperationsProtocol {
    
    enum ErrorResponse: Error {
        case error
    }
    
    enum ProjectsResponse {
        case successReponse(Projects)
        case error(ErrorResponse)
    }
    
    private let projectsResponse: ProjectsResponse
    
    init(projectsResponse: ProjectsResponse) {
        self.projectsResponse = projectsResponse
    }
    
    func requestCaseStudies(completionHandler: @escaping (Result<Projects, Error>) -> Void) {
        switch projectsResponse {
        case .successReponse(let project):
            return completionHandler(.success(project))
        case .error(let error):
            return completionHandler(.failure(error))
        }
    }
    
    func loadImage(url: String, completion: @escaping (Result<Data, Error>) -> Void) {
        print("called loadImage")
    }
}
