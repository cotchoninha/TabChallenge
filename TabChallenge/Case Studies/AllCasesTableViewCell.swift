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
    @IBOutlet private var projectImage: UIImageView!
    static let reuseIdentifier = "allCasesTableViewCell"
    
    @IBOutlet private var teaserLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
