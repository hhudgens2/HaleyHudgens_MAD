//
//  Scene2ViewController.swift
//  Project1
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController {
    
    @IBOutlet weak var cactusPic1: UIImageView!
    @IBOutlet weak var birdPic: UIImageView!
    @IBOutlet weak var cactusPic2: UIImageView!
    @IBOutlet weak var cactusPic3: UIImageView!
    @IBOutlet weak var kermitPic: UIImageView!
    
    
    @IBAction func unwindSegue(_segue:UIStoryboardSegue){
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        cactusPic1.layer.borderWidth=1.0
        cactusPic1.layer.masksToBounds = false
        cactusPic1.layer.cornerRadius =
            cactusPic1.frame.size.height/2
        cactusPic1.clipsToBounds = true
        
        birdPic.layer.borderWidth=1.0
        birdPic.layer.masksToBounds = false
        birdPic.layer.cornerRadius = birdPic.frame.size.height/2
        birdPic.clipsToBounds = true
        
        
        cactusPic2.layer.borderWidth=1.0
        cactusPic2.layer.masksToBounds = false
        cactusPic2.layer.cornerRadius = cactusPic2.frame.size.height/2
        cactusPic2.clipsToBounds = true
        
        
        cactusPic3.layer.borderWidth=1.0
        cactusPic3.layer.masksToBounds = false
        cactusPic3.layer.cornerRadius = cactusPic3.frame.size.height/2
        cactusPic3.clipsToBounds = true
        
        
        kermitPic.layer.borderWidth=1.0
        kermitPic.layer.masksToBounds = false
        kermitPic.layer.cornerRadius = kermitPic.frame.size.height/2
        kermitPic.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
