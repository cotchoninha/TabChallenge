//
//  SelectedCasePresenter.swift
//  TabChallenge
//
//  Created by Spare on 10/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import Foundation

protocol SelectedCasePresentable: AnyObject {
    func configureClientNameLabel(with name: String)
}

final class SelectedCasePresenter {
    
    weak var view: SelectedCasePresentable?
    
    private let selectedCaseViewModel: SelectedCaseViewModel
    
    init(selectedCaseViewModel: SelectedCaseViewModel) {
        self.selectedCaseViewModel = selectedCaseViewModel
    }
    
    func configureClientNameLabel() {
        self.view?.configureClientNameLabel(with: selectedCaseViewModel.selectedCase.client?.uppercased() ?? "")
    }
    
    func getSection(with row: Int) -> Section {
        return selectedCaseViewModel.selectedCase.sections[row]
    }
    
    func getNumberOfRowsInSection() -> Int {
        return selectedCaseViewModel.selectedCase.sections.count
    }
}
