//
//  AllCasesViewController.swift
//  TabChallenge
//
//  Created by Spare on 02/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

final class AllCasesViewController: UIViewController {

    @IBOutlet private var tabLogoImage: UIImageView!
    @IBOutlet private var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabLogoImage()
        setupTableView()
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
}

extension AllCasesViewController: UITableViewDelegate {
    
}

extension AllCasesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AllCasesTableViewCell.reuseIdentifier, for: indexPath) as? AllCasesTableViewCell else {
            return UITableViewCell()
        }
        return cell
        
    }
    
    
}
