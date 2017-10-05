//
//  Scene4ViewController.swift
//  Project1
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class Scene4ViewController: UIViewController {
    @IBOutlet weak var cactusPic1: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cactusPic1.layer.borderWidth=1.0
        cactusPic1.layer.masksToBounds = false
        cactusPic1.layer.cornerRadius =
            cactusPic1.frame.size.height/2
        cactusPic1.clipsToBounds = true

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
