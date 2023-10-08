//
//  GeoCalcButton.swift
//  GeoCalculator
//
//  Created by Caroline Carlson on 10/8/23.
//

import UIKit

class GeoCalcButton: UIButton {
override func awakeFromNib() {
    self.backgroundColor = FOREGROUND_COLOR
    self.tintColor = BACKGROUND_COLOR // this is the foreground
    self.layer.cornerRadius = 5.0
} }
