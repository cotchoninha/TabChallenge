//
//  PaddingLabel.swift
//  TabChallenge
//
//  Created by Spare on 15/06/2020.
//  Copyright © 2020 Spare. All rights reserved.
//

import UIKit

/// Padding Label - Label with internal padding

class PaddingLabel: UILabel {
    
    /// set UIEdgeInsets of textInsets to apply padding to label
    /// 
    /// - Usage: label.textInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
    var textInsets = UIEdgeInsets.zero {
        didSet { invalidateIntrinsicContentSize() }
    }

    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        let insetRect = bounds.inset(by: textInsets)
        let textRect = super.textRect(forBounds: insetRect, limitedToNumberOfLines: numberOfLines)
        let invertedInsets = UIEdgeInsets(top: -textInsets.top,
                                          left: -textInsets.left,
                                          bottom: -textInsets.bottom,
                                          right: -textInsets.right)
        return textRect.inset(by: invertedInsets)
    }

    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: textInsets))
    }
}

