//
//  AllClassesTableViewCell.swift
//  TabChallenge
//
//  Created by Spare on 02/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

final class AllCasesTableViewCell: UITableViewCell {

    @IBOutlet private var containerView: UIView!
    @IBOutlet private var clientNameLabel: UILabel!
    @IBOutlet private var projectImage: ImageLoader!
    @IBOutlet private var teaserLabel: UILabel!
    
    static let reuseIdentifier = "allCasesTableViewCell"
    
    private var presenter = AllCasesPresenter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.layer.cornerRadius = 8.0
        containerView.clipsToBounds = true
        setupProjectImage()
    }

    func configureView(with viewModel: AllCasesViewModel) {
        clientNameLabel.text = viewModel.clientName
        guard let url = URL(string: viewModel.clientImage) else {
            return
        }
        projectImage.loadImageWithUrl(url)
//        setupProjectImage()
        teaserLabel.text = viewModel.teaser
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupProjectImage() {
        projectImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [projectImage.heightAnchor.constraint(equalToConstant: projectImage.contentClippingRect.height), projectImage.topAnchor.constraint(equalTo: clientNameLabel.bottomAnchor, constant: 10), projectImage.bottomAnchor.constraint(equalTo: teaserLabel.topAnchor, constant: -16), projectImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10), projectImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10)]
        NSLayoutConstraint.activate(constraints)
        projectImage.contentMode = .scaleAspectFill
        projectImage.layer.cornerRadius = 10.0
    }
    
}
