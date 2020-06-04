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
    }

    func configureView(with viewModel: AllCasesViewModel) {
        clientNameLabel.text = viewModel.clientName
        guard let url = URL(string: viewModel.clientImage) else {
            return
        }
        projectImage.loadImageWithUrl(url)
        projectImage.frame = projectImage.contentClippingRect
        teaserLabel.text = viewModel.teaser
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
