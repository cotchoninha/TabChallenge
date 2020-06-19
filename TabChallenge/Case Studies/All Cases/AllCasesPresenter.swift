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
        networkOperations.requestCaseStudies { projects, error in
            if error != nil {
                print("SHOW ERROR ALERT TO USER WITH RETRY BUUTTON \(error?.localizedDescription)")
                return
            }
            guard let caseStudies = projects?.caseStudies else {
                print("there are no caseStudies available")
                return
            }
            print(caseStudies)
            self.caseStudies = caseStudies
            self.viewModels = caseStudies.map({ caseStudie in
                return AllCasesViewModel(clientName: caseStudie.client ?? "", clientImage: caseStudie.heroImage, teaser: caseStudie.teaser)
            })
            self.view?.reloadData()
        }
        print("debuging breakpoint")
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
