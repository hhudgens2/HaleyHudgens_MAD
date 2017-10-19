//
//  Scene2ViewController.swift
//  favorites_class
//
//  Created by Haley  Hudgens  on 10/3/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var userItemDue: UITextField!
    @IBOutlet weak var userTimeDue: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneDue"{
            let scene1ViewController = segue.destination as! ViewController
            
            if userItemDue.text!.isEmpty == false{
                scene1ViewController.user.itemDue=userItemDue.text
            }
            if userTimeDue.text!.isEmpty == false{
                scene1ViewController.user.timeDue=userTimeDue.text
            }
        }
    }

    
    
    override func viewDidLoad() {
        userItemDue.delegate=self
        userTimeDue.delegate=self
        
        super.viewDidLoad()
    }
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   

}
