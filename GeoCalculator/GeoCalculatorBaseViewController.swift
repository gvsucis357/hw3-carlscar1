//
//  GeoCalculatorBaseViewController.swift
//  GeoCalculator
//
//  Created by Caroline Carlson on 10/6/23.
//

import UIKit

class GeoCalculatorBaseViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BACKGROUND_COLOR
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

class NavigationController : UINavigationController {
    override open var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}
