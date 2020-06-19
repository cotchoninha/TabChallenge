//
//  CALayer+Extensions.swift
//  TabChallenge
//
//  Created by Spare on 06/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

extension CALayer {
    /// Function that applies shadow to view.
    ///
    /// - Parameters:
    ///     - color: shadow color.
    ///     - alpha: shadowOpacity.
    ///     - x: shadow offset width.
    ///     - y: shadow offset height
    ///     - blur: shadow radius.
    ///     - spread: shadow sprea.
    func applySketchShadow(
        color: UIColor = .black,
        alpha: Float = 0.5,
        x: CGFloat = 0,
        y: CGFloat = 2,
        blur: CGFloat = 4,
        spread: CGFloat = 0)
    {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
            shadowPath = nil
        } else {
            let dx = -spread
            let rect = bounds.insetBy(dx: dx, dy: dx)
            shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
