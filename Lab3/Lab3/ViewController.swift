//
//  ViewController.swift
//  Lab3
//
//  Created by Haley  Hudgens  on 10/9/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var Fahrenheit: UITextField!
    
    @IBOutlet weak var cConvert: UILabel!
    @IBOutlet weak var kConvert: UILabel!
    
   
  
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateDegreeConversions(){
        var fAmount:Float
        
        if Fahrenheit.text!.isEmpty{
        fAmount = 0.0
        } else {
            fAmount = Float(Fahrenheit.text!)!
        }
     
        let fNumber=Int(Fahrenheit.text!)
        let celsius = (fAmount-32)*(5/9)
        let kelvin = (5/9)*(fAmount-32)+273
  
            if fNumber! > 0 {
                fAmount = Float(fNumber!)
            } else {
               
                let alert=UIAlertController(title: "Warning", message: "The number of degrees must be greater than 0. It's too cold.", preferredStyle: UIAlertControllerStyle.alert)
                
                let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction)
                let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: {action in
                    self.Fahrenheit.text="1"
                    self.updateDegreeConversions()
                })
                alert.addAction(okAction)
                present(alert, animated: true, completion: nil)


            }
        
        let conversionFormatter = NumberFormatter()
        conversionFormatter.numberStyle=NumberFormatter.Style.decimal
        
        cConvert.text=conversionFormatter.string(from: NSNumber(value: celsius))
        kConvert.text=conversionFormatter.string(from: NSNumber(value: kelvin))
    }
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField){
    updateDegreeConversions()
        
    }

    override func viewDidLoad() {
        Fahrenheit.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

