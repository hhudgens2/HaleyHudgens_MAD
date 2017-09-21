//
//  ViewController.swift
//  Lab2
//
//  Created by Haley  Hudgens  on 9/19/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var seasonsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    
  
    func updateImage() {
        if imageControl.selectedSegmentIndex == 0 {
            titleLabel.text="Spring"
            titleLabel.textColor=UIColor.purple
            seasonsImage.image=UIImage(named: "spring")
        }
        else if imageControl.selectedSegmentIndex == 1 {
            titleLabel.text="Summer"
            titleLabel.textColor=UIColor.green
            seasonsImage.image=UIImage(named: "summer")
        }
        else if imageControl.selectedSegmentIndex == 2 {
            titleLabel.text="Fall"
            titleLabel.textColor=UIColor.orange
            seasonsImage.image=UIImage(named: "fall")
        }
        else if imageControl.selectedSegmentIndex == 3 {
            titleLabel.text="Winter"
            titleLabel.textColor=UIColor.cyan
            seasonsImage.image=UIImage(named: "winter")
        }
        
    }
    
    func updateCaps() {
        if capitalSwitch.isOn {
            titleLabel.text=titleLabel.text?.uppercased()
        } else {
            titleLabel.text=titleLabel.text?.lowercased()
        }
        
    }
    
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
      
    }
    
    @IBAction func updateFont(_ sender: UISwitch) {
        updateCaps()
       
    }
    
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value //float
        fontSizeLabel.text=String(format: "%.0f", fontSize) //convert float to String
        let fontSizeCGFloat=CGFloat(fontSize) //convert float to CGFloat
        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat) //create a UIFont object and assign to the font property
    }
    
   
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

