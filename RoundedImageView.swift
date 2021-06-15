//
//  RoundedImageView.swift
//  CoffeeTime
//
//  Created by Mahesh Cheliya on 12/07/19.
//  Copyright © 2019 Sheliya Infotech. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedImageView : UIImageView {
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet {
            layer.cornerRadius = cornerRadius
            clipsToBounds = true
        }
    }
    
    //Normal state bg and border
    @IBInspectable var normalBorderColor: UIColor? {
        didSet {
            layer.borderColor = normalBorderColor?.cgColor
        }
    }
    
    @IBInspectable var isRounded: Bool = false
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if (isRounded) {
//            layer.cornerRadius = bounds.size.width / 2
            layer.cornerRadius = bounds.size.height / 2
            clipsToBounds = true
        }
    }
}
