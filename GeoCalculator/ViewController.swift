//
//  ViewController.swift
//  GeoCalculator
//
//  Created by Jonathan Engelsma on 9/15/21.
//

import UIKit
import CoreLocation

class ViewController: GeoCalculatorBaseViewController {

    @IBOutlet weak var p1Lat: DecimalMinusTextField!
    @IBOutlet weak var p1Lng: DecimalMinusTextField!
    @IBOutlet weak var p2Lat: DecimalMinusTextField!
    @IBOutlet weak var p2Lng: DecimalMinusTextField!
    
    @IBOutlet weak var distanceLabel: GeoCalcLabel!
    @IBOutlet weak var bearingLabel: GeoCalcLabel!
    
    @IBOutlet weak var CalculateButton: GeoCalcButton!
    @IBOutlet weak var ClearButton: GeoCalcButton!
    @IBOutlet weak var SettingsButton: GeoCalcButton!
    
    var distanceUnits : String = "Kilometers"
    var bearingUnits : String = "Degrees"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    func doCalculatations()
    {
        guard let p1lt = Double(self.p1Lat.text!), let p1ln = Double(self.p1Lng.text!), let p2lt = Double(self.p2Lat.text!), let p2ln = Double(self.p2Lng.text!) else {
            return
        }
        let p1 = CLLocation(latitude: p1lt, longitude: p1ln)
        let p2 = CLLocation(latitude: p2lt, longitude: p2ln)
        let distance = p1.distance(from: p2)
        let bearing = p1.bearingToPoint(point: p2)
        
        if distanceUnits == "Kilometers" {
            self.distanceLabel.text = "Distance: \((distance / 10.0).rounded() / 100.0) kilometers"
        } else {
            self.distanceLabel.text = "Distance: \((distance * 0.0621371).rounded() / 100.0) miles"
        }
        
        if bearingUnits == "Degrees" {
            self.bearingLabel.text = "Bearing: \((bearing * 100).rounded() / 100.0) degrees."
        } else {
            self.bearingLabel.text = "Bearing: \((bearing * 1777.7777777778).rounded() / 100.0) mils."
        }
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        self.doCalculatations()
        self.view.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    

    @IBAction func clearButtonPressed(_ sender: UIButton) {
        self.p1Lat.text = ""
        self.p1Lng.text = ""
        self.p2Lat.text = ""
        self.p2Lng.text = ""
        self.distanceLabel.text = "Distance: "
        self.bearingLabel.text = "Bearing: "
        self.view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "settingsSegue" {
            if let dest = segue.destination.children[0] as? SettingsViewController {
                dest.dUnits = self.distanceUnits
                dest.bUnits = self.bearingUnits
                dest.delegate = self
            }
        }
    }
}

extension ViewController : SettingsViewControllerDelegate
{
    func settingsChanged(distanceUnits: String, bearingUnits: String)
    {
        self.distanceUnits = distanceUnits
        self.bearingUnits = bearingUnits
        self.doCalculatations()
    }
}


