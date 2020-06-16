//
//  SelectedCaseStudieViewController.swift
//  TabChallenge
//
//  Created by Spare on 06/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

final class SelectedCaseViewController: UIViewController, SelectedCasePresentable {
    
    @IBOutlet private var projectNameLabel: UILabel!
    @IBOutlet private var tableView: UITableView!
    
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
        presenter.view = self
        presenter.configureClientNameLabel()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SelectedCaseTableViewCell", bundle: nil), forCellReuseIdentifier: SelectedCaseTableViewCell.reuseIdentifier)
    }
    
    func configureClientNameLabel(with name: String) {
        projectNameLabel.text = name
    }
}

extension SelectedCaseViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectedCaseTableViewCell.reuseIdentifier, for: indexPath) as? SelectedCaseTableViewCell else {
            return UITableViewCell()
        }
        let model = presenter.getSection(with: indexPath.row)
        cell.configureCell(with: model)
        return cell
    }
    
    
}
