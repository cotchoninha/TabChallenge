//
//  SelectedCasePresenterTests.swift
//  TabChallengeTests
//
//  Created by Spare on 19/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import XCTest
@testable import TabChallenge

class SelectedCasePresenterTests: XCTestCase {
    
    var selectedCasePresenter: SelectedCasePresenter!
    var view: SelectedCaseView!
    let response = createMockReponse()

    override func setUp() {
        view = SelectedCaseView()
        selectedCasePresenter = SelectedCasePresenter(selectedCaseViewModel: SelectedCaseViewModel(selectedCase: response.caseStudies[0]))
        selectedCasePresenter.view = view
        
    }

    func test_configureClientNameLabel_isCalled() {
        selectedCasePresenter.configureClientNameLabel()
        XCTAssertTrue(view.configureClientNameLabelCalled)
        
    }
    
    func test_getSection_returnsCorrectSection() {
        let expectedSection = response.caseStudies[0].sections[0]
        let section = selectedCasePresenter.getSection(with: 0)
        XCTAssertEqual(expectedSection, section)
        
    }
    
    func test_getNumberOfRowsInSection_returnsCorrectNumber() {
        let numberOfRows = selectedCasePresenter.getNumberOfRowsInSection()
        let expectedNumberOfRows = response.caseStudies[0].sections.count
        XCTAssertEqual(numberOfRows, expectedNumberOfRows)

    }
}

class SelectedCaseView: SelectedCasePresentable {
    
    var configureClientNameLabelCalled = false
    
    func configureClientNameLabel(with name: String) {
        configureClientNameLabelCalled.toggle()
    }
}
