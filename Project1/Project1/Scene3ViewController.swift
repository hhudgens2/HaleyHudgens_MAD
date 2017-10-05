//
//  Scene3ViewController.swift
//  Project1
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class Scene3ViewController: UIViewController {
    @IBOutlet weak var cactusPic: UIImageView!
    
   //Link to User Profile Facebook
    // adapted from https://stackoverflow.com/questions/39392939/how-to-add-a-hyperlink-button-on-ios-swift
    @IBAction func fbLink(_ sender: Any) {
        openFBUrl(urlStr: "https://www.facebook.com/hhudgens2")
    }
    
    func openFBUrl(urlStr:String!) {
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }
    
    
    //Link to User Profile Instagram
    
    @IBAction func instaLink(_ sender: Any) {
         openInstaUrl(urlStr: "https://www.instagram.com/?hl=en")
    }
    func openInstaUrl(urlStr:String!) {
        if let url = NSURL(string:urlStr) {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//adapted from https://stackoverflow.com/questions/25587713/how-to-set-imageview-in-circle-like-imagecontacts-in-swift-correctly
        
        
        cactusPic.layer.borderWidth=1.0
        cactusPic.layer.masksToBounds = false
        cactusPic.layer.cornerRadius = cactusPic.frame.size.height/2
        cactusPic.clipsToBounds = true
        
        
    
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
