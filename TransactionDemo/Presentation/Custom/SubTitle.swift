//
//  SubTitle.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 04/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import UIKit
import FontAwesome_swift

@IBDesignable
class SubTitle: UIView {
    
    var label: UILabel = UILabel()
    let iconLabel = UILabel()
    
    @IBInspectable
    var text: String = "" {
        didSet {
            label.text = text
        }
    }
    
    @IBInspectable
    var textColor: UIColor = Settings.textColor {
        didSet {
            label.textColor = textColor
            iconLabel.textColor = textColor
        }
    }
    
    @IBInspectable
    var fontSize: CGFloat = 24 {
        didSet {
            label.font = UIFont(name: label.font.fontName, size: fontSize)
            iconLabel.font = UIFont.fontAwesome(ofSize: fontSize + 15)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(origin: .zero, size: frame.size)
        label.textAlignment = .center
        label.layer.backgroundColor = UIColor.clear.cgColor
        label.textColor = textColor
        label.font = UIFont(name: Settings.lightFontName, size: fontSize)
        
        iconLabel.frame = CGRect(origin: .zero, size: CGSize(width: frame.size.width - frame.size.width * 0.05, height: frame.size.height))
        iconLabel.font = UIFont.fontAwesome(ofSize: fontSize + 15)
        iconLabel.text = String.fontAwesomeIcon(name: .angleDown)
        iconLabel.textAlignment = .right
        iconLabel.layer.backgroundColor = UIColor.clear.cgColor
        iconLabel.textColor = textColor
        
        addSubview(label)
        addSubview(iconLabel)
    }
}
