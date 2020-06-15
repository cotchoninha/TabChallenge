//
//  SelectedCaseTableViewCell.swift
//  TabChallenge
//
//  Created by Spare on 12/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

class SelectedCaseTableViewCell: UITableViewCell {

    @IBOutlet private var stackview: UIStackView!
    
    static let reuseIdentifier = "selectedCaseTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(with viewModel: SelectedCaseViewModel) {
        viewModel.selectedCase.sections.forEach { section in
                 if section.title != nil {
                     configureTitleLabel(with: section.title!)
                 }
                 section.bodyElements.forEach { bodyElement in
                     switch bodyElement {
                     case .title(let title):
                         configureBodyText(with: title)
                     case .bodyImage(_):
                         break
                     }
                 }
             }
         }

    private func configureTitleLabel(with title: String) {
        let titleLabel = PaddingLabel()
        stackview.addArrangedSubview(titleLabel)
        titleLabel.textInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        titleLabel.text = title
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.textAlignment = .center
        titleLabel.textColor = .darkGray
        titleLabel.backgroundColor = .systemGray5
        titleLabel.layer.cornerRadius = 10.0
        titleLabel.layer.applySketchShadow()
    }
    
    private func configureBodyText(with text: String) {
        let bodyTextLabel = UILabel()
        stackview.addArrangedSubview(bodyTextLabel)
        bodyTextLabel.text = text
        bodyTextLabel.numberOfLines = 0
        bodyTextLabel.font = UIFont.preferredFont(forTextStyle: .body)
        bodyTextLabel.textColor = .darkGray
    }
    
    private func configureBodyElements() {
        
    }
    
}
