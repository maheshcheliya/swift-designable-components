//
//  DesignableUITextField.swift
//  CoffeeTime
//
//  Created by Mahesh Cheliya on 29/05/19.
//  Copyright © 2019 Sheliya Infotech. All rights reserved.
//

import UIKit


@IBDesignable
class DesignableUITextField: UITextField {
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var rightImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    var borderColor: UIColor = UIColor.init(red: 238.0/255.0, green: 238.0/255.0, blue: 238.0/255.0, alpha: 1.0) {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var customBackgroundColor: UIColor? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2 {
        didSet {
            updateView()
        }
    }
    
    
    @IBInspectable var paddingLeft: CGFloat = 15 {
        didSet {
            updateView()
        }
    }

    @IBInspectable var paddingRight: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var paddingTop: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var paddingBottom: CGFloat = 0 {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var bottomLine: Bool = false {
        didSet {
            updateView()
        }
    }

    var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }
    
    private var tmpLeft : CGFloat = 0
    private var tmpRight : CGFloat = 0
    
    func updateView() {
        
        if let image = leftImage {
            
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            mainView.layer.cornerRadius = cornerRadius
            
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 15.0, y: 15.0, width: 15.0, height: 15.0)

            mainView.addSubview(imageView)
            
            tmpLeft = 40
            
            self.leftViewMode = .always
            self.leftView = mainView
            
        } else {
            tmpLeft = 0.0
        }
        
        if let image = rightImage {
            
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
            mainView.layer.cornerRadius = cornerRadius
            
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: 15.0, y: 15.0, width: 15.0, height: 15.0)
            mainView.addSubview(imageView)
            
            tmpRight = 40
            
            self.rightViewMode = .always
            self.rightView = mainView
            
        } else {
            tmpRight = 0.0
        }
        
        if(bottomLine) {
            self.borderStyle = .none
            self.layer.backgroundColor = UIColor.white.cgColor
            
            self.layer.masksToBounds = false
            self.layer.shadowColor = color.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
            self.layer.shadowOpacity = 0.0
            self.layer.shadowRadius = 0.0
        }
        
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
        self.layer.cornerRadius = cornerRadius
        
        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])
    }
    
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: paddingTop, left: (paddingLeft + tmpLeft), bottom: paddingBottom, right: (paddingRight + tmpRight)))
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: paddingTop, left: (paddingLeft + tmpLeft), bottom: paddingBottom, right: (paddingRight + tmpRight)))
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(top: paddingTop, left: (paddingLeft + tmpLeft), bottom: paddingBottom, right: (paddingRight + tmpRight)))
    }
}
