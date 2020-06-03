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
    private let networkOperations: NetworkOperations
    
    init(networkOperations: NetworkOperations = NetworkOperations()) {
        self.networkOperations = networkOperations
    }
    
    func loadCaseStudies() {
        networkOperations.requestCaseStudies { projects, error in
            if error != nil {
                print("SHOW ERROR ALERT TO USER WITH RETRY BUUTTON")
                return
            }
            projects?.caseStudies.forEach({ caseStudie in
                let vm = AllCasesViewModel(clientName: caseStudie.client ?? "", clientImage: caseStudie.heroImage, teaser: caseStudie.teaser)
                self.viewModels.append(vm)
            })
            self.view?.reloadData()
        }
    }
    
    func getViewModels() -> [AllCasesViewModel] {
        return viewModels
    }
    
    func getNumberOfRowsInSection() -> Int {
        return viewModels.count
    }
}
