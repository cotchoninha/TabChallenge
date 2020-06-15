//
//  HelperFuncions.swift
//  TabChallenge
//
//  Created by Spare on 11/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

public func pinViewToSuperview(view: UIView, superview: UIView, topAnchor: CGFloat = 0, bottomAnchor: CGFloat = 0, trailingAnchor: CGFloat = 0, leadingAnchor: CGFloat = 0) {
    view.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [view.topAnchor.constraint(equalTo: superview.topAnchor, constant: topAnchor), view.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottomAnchor), view.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: trailingAnchor), view.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: leadingAnchor)]
    NSLayoutConstraint.activate(constraints)
}
