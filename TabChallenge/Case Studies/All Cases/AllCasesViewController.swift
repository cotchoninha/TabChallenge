//
//  AllCasesViewController.swift
//  TabChallenge
//
//  Created by Spare on 02/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

final class AllCasesViewController: UIViewController, AllCassesViewPresentable {
    
    @IBOutlet private var tabLogoImage: UIImageView!
    @IBOutlet private var tableView: UITableView!
    private var presenter = AllCasesPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabLogoImage()
        setupTableView()
        presenter.view = self
        presenter.loadCaseStudies()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let cellNib = UINib(nibName: "AllCasesTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: AllCasesTableViewCell.reuseIdentifier)
    }
    private func setupTabLogoImage() {
        tabLogoImage.layer.cornerRadius = 8.0
        tabLogoImage.clipsToBounds = true
    }
    
    func reloadData() {
        tableView.reloadData()
    }
}

extension AllCasesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCaseStudiesVC = SelectedCaseViewController()
        self.present(selectedCaseStudiesVC, animated: true, completion: nil)
    }
    
}

extension AllCasesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getNumberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllCasesTableViewCell.reuseIdentifier, for: indexPath) as? AllCasesTableViewCell else {
            return UITableViewCell()
        }
        let viewModels = presenter.getViewModels()
        cell.configureView(with: viewModels[indexPath.row])
        return cell
        
    }
    
    
}
