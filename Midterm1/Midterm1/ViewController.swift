//
//  ViewController.swift
//  Midterm1
//
//  Created by Haley  Hudgens  on 10/19/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var commuteMiles: UITextField!
    @IBOutlet weak var commuteTimeLabel: UILabel!
    @IBOutlet weak var gasLabel: UILabel!
    @IBOutlet weak var gasSliderLabel: UILabel!
    @IBOutlet weak var monthSwitch: UISwitch!
    
    
    
  
    @IBAction func gasSlider(_ sender: UISlider) {
        let gasNumber=sender.value
    gasSliderLabel.text=String(format: "%.0f", gasNumber)
    }
    
   
    @IBAction func updateTotals(_ sender: UISwitch) {
        if monthSwitch.isOn {
            monthTotal()
            
        } else {
            dayTotal()

        }
    }
    
    @IBAction func updateTotals(_ sender: Any) {
    }
    
    
    let carSpeed = 20
    let milesPerGallon = 24
    
    func dayTotal() {
        let cMiles = Int(commuteMiles.text!)
        let ct = (cMiles!*60)/carSpeed
        let gP = cMiles!/milesPerGallon
        
        commuteTimeLabel.text=String(ct)
        gasLabel.text=String(gP)
    }
    
    
    func monthTotal(){
        let cMiles = Int(commuteMiles.text!)
        let ct = ((cMiles!*60)/carSpeed)*20
        let gP = (cMiles!/milesPerGallon)*20
        
        commuteTimeLabel.text=String(ct)
        gasLabel.text=String(gP)
    
    }
    
    @IBAction func commuteButton(_ sender: Any) {
        dayTotal()
        

        
        
        if commuteMiles.text!.isEmpty {
            commuteTime = 0.0
        } else {
            commuteTime = Float(commuteMiles.text!)!
        }
        //        if commuteMiles.text!.isEmpty {
        //            gasLabel = 0.0
        //        } else {
        //            gasLabel = Float(commuteMiles.text!)!
        //        }
        
    
        
//        let currencyFormatter = NumberFormatter()
//        currencyFormatter.numberStyle=NumberFormatter.Style.currency //set the number style
//        commuteTimeLabel.text=currencyFormatter.string(from: NSNumber(value: ct)) //returns a formatted string
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    
    

    
    override func viewDidLoad() {
        
        commuteMiles.delegate = self
        
        
        
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        updateCommuteTotals()
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

