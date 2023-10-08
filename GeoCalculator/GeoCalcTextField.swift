//
//  DecimalMinusTextBase.swift
//  GeoCalculator
//
//  Created by Caroline Carlson on 10/8/23.
//

import UIKit

class GeoCalcTextField: UITextField {

    override func awakeFromNib() {
        self.tintColor = FOREGROUND_COLOR
        self.backgroundColor = UIColor.clear
        
        guard let ph = self.placeholder  else {
            return
        }
        
        self.attributedPlaceholder =
        NSAttributedString(string: ph, attributes: [NSAttributedString.Key.foregroundColor :
        FOREGROUND_COLOR])
        
        self.layer.borderWidth = 1.0
        self.layer.borderColor = FOREGROUND_COLOR.cgColor
        self.layer.cornerRadius = 5.0
        self.borderStyle = .roundedRect
        
        self.textColor = FOREGROUND_COLOR
    
    }
}
