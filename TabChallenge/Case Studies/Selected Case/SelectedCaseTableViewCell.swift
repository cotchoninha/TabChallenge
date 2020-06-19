//
//  SelectedCaseTableViewCell.swift
//  TabChallenge
//
//  Created by Spare on 12/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

final class SelectedCaseTableViewCell: UITableViewCell {
    
    @IBOutlet private var stackview: UIStackView!
    
    static let reuseIdentifier = "selectedCaseTableViewCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(with section: Section) {
        //remove all views from superview before adding views to the stackview
        stackview.arrangedSubviews.forEach { view in
            view.removeFromSuperview()
        }
        if section.title != nil {
            configureTitleLabel(with: section.title!)
        }
        section.bodyElements.forEach { bodyElement in
            switch bodyElement {
            case .bodyText(let bodyText):
                configureBodyText(with: bodyText)
            case .bodyImage(let bodyImage):
                configureBodyImage(with: bodyImage.imageURL)
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
    
    private func configureBodyImage(with url: String) {
        let bodyImage = ImageLoader()

        guard let url = URL(string: url) else {
            return
        }
        stackview.addArrangedSubview(bodyImage)
        bodyImage.loadImageWithUrl(url)
        bodyImage.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [bodyImage.heightAnchor.constraint(equalToConstant: 150)]
        NSLayoutConstraint.activate(constraints)
        bodyImage.contentMode = .scaleAspectFit
        bodyImage.layer.cornerRadius = 10.0
        
    }
}
