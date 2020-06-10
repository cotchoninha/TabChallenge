//
//  SelectedCaseStudieViewController.swift
//  TabChallenge
//
//  Created by Spare on 06/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

final class SelectedCaseViewController: UIViewController {

    @IBOutlet private var projectNameLabel: UILabel!
    
    @IBOutlet private var stackview: UIStackView!
    
    private let presenter: SelectedCasePresenter
    
    init(presenter: SelectedCasePresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    

}
