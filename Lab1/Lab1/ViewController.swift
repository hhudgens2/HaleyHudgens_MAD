//
//  ViewController.swift
//  Lab1
//
//  Created by Haley  Hudgens  on 9/13/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var desertText: UILabel!
    @IBAction func desertButton(_ sender: UIButton) {
        desertText.text="Get a cactus!"
    }
    
    
    
    @IBOutlet weak var plantImage: UIImageView!
    
    @IBAction func choosePlants(_ sender: UIButton) {
        if sender.tag == 1 {
            plantImage.image=UIImage(named: "cactus")
        }
        else if sender.tag == 2 {
            plantImage.image=UIImage(named: "jungle")
        }
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

