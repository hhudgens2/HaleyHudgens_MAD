//
//  Scene2ViewController.swift
//  Project1_Redo
//
//  Created by Haley  Hudgens  on 12/6/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate{
    
    @IBOutlet weak var nameInputLabel: UITextField!
    @IBOutlet weak var desInputLabel: UITextView!
    @IBOutlet weak var dateInputLabel: UITextField!
    
    @IBOutlet weak var rememberPerson: UIButton!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { if segue.identifier == "doneAdding"{
        print("input segue was called")
        let scene1ViewController = segue.destination as! ViewController
        if nameInputLabel.text!.isEmpty == false{
            scene1ViewController.user.addName = nameInputLabel.text
        } else {
         scene1ViewController.user.addName = "no name"
        }
        if desInputLabel.text!.isEmpty == false{
            scene1ViewController.user.addDes=desInputLabel.text
        } else {
            scene1ViewController.user.addDes = "no description entered"
        }
        if dateInputLabel.text!.isEmpty == false{
            scene1ViewController.user.addDate=dateInputLabel.text
        }
        else {
            scene1ViewController.user.addDate = "no date"
        }
        
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameInputLabel.delegate=self
        desInputLabel.delegate=self
        dateInputLabel.delegate=self
        
        //button with rounded edges
        rememberPerson.layer.cornerRadius = 15.0
        rememberPerson.clipsToBounds = true
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.addTarget(self, action: #selector(Scene2ViewController.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        dateInputLabel.inputView = datePicker
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        dateInputLabel.text = formatter.string(from: sender.date)
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    


  
}
    


