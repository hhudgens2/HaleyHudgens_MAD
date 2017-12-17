//
//  PeopleInfoViewController.swift
//  Project1_Redo
//
//  Created by Haley  Hudgens  on 12/8/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class PeopleInfoViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var metOn: UIImageView!
    
    var getName = "who"
    var getDate = "when"
    var getDes = "about"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make scroll view adjust to desLabel size
        scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: desLabel.bottomAnchor).isActive = true

        


        nameLabel.text = getName
        dateLabel.text = getDate
        desLabel.text = getDes
        
        metOn.layer.cornerRadius = 15.0
        metOn.clipsToBounds = true
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


//scroll view code from here https://www.youtube.com/watch?v=me0leCA0yHU

