//
//  AllCasesPresenter.swift
//  TabChallenge
//
//  Created by Spare on 03/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import Foundation

protocol AllCassesViewPresentable: AnyObject {
    func reloadData()
}

final class AllCasesPresenter {
    
    weak var view: AllCassesViewPresentable?
    
    private var viewModels: [AllCasesViewModel] = []
    private let networkOperations: NetworkOperationsProtocol
    private var caseStudies: [CaseStudy] = []
    
    init(networkOperations: NetworkOperationsProtocol = NetworkOperations()) {
        self.networkOperations = networkOperations
    }
    
    func loadCaseStudies() {
        networkOperations.requestCaseStudies { result in
            
            switch result {
            case .failure(let error):
                print("SHOW ERROR ALERT TO USER WITH RETRY BUUTTON \(error.localizedDescription)")
            case .success(let projects):
                self.caseStudies = projects.caseStudies
                self.viewModels = self.caseStudies.map({ caseStudie in
                    return AllCasesViewModel(clientName: caseStudie.client ?? "", clientImage: caseStudie.heroImage, teaser: caseStudie.teaser)
            })
        }
            self.view?.reloadData()
        }
    }
    
    func getViewModels() -> [AllCasesViewModel] {
        return viewModels
    }
    
    func getSelectedCaseViewModel(atRow: Int) -> SelectedCaseViewModel {
        let viewModel = SelectedCaseViewModel(selectedCase: caseStudies[atRow])
        return viewModel
    }
    
    func getNumberOfRowsInSection() -> Int {
        return viewModels.count
    }    
}
