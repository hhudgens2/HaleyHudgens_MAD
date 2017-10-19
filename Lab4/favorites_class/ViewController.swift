//
//  ViewController.swift
//  favorites_class
//
//  Created by Haley  Hudgens  on 10/3/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var itemDueLabel: UILabel!
    @IBOutlet weak var timeDueLabel: UILabel!
    
    var user=ItemDue()
    
    let filename = "itemDue.plist"

    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        itemDueLabel.text=user.itemDue
        timeDueLabel.text=user.timeDue
    }
    
    func docFilePath(_ filename: String) -> String?{
        //locate the documents directory
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString //document directory
        //creates the full path to our data file
        print(dir.appendingPathComponent(filename))
        return dir.appendingPathComponent(filename)
    }



    override func viewDidLoad() {
         let filePath = docFilePath(filename)
        
        //if the data file exists, use it
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            //load the data of the plist file into a dictionary
            let dataDictionary = NSDictionary(contentsOfFile: path!) as! [String:String]
            //load favorite book
            if dataDictionary.keys.contains("item") {
                user.itemDue = dataDictionary["item"]
                itemDueLabel.text=user.itemDue
            }
            //load favorite author
            if dataDictionary.keys.contains("time") {
                user.timeDue = dataDictionary["time"]
                timeDueLabel.text=user.timeDue
            }
            
            //application instance
            let app = UIApplication.shared
            //subscribe to the UIApplicationWillResignActiveNotification notification
            NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)

      
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        }
    }
    
        
        
        //called when the UIApplicationWillResignActiveNotification notification is posted
        //all notification methods take a single NSNotification instance as their argument
        func applicationWillResignActive(_ notification: Notification){
            let filePath = docFilePath(filename)
            let data = NSMutableDictionary()
            //adds
            if user.itemDue != nil{
                data.setValue(user.itemDue, forKey: "item")
                
            }
            if user.timeDue != nil{
                data.setValue(user.timeDue, forKey: "time")
            }
            //write the contents of the array to our plist file
            data.write(toFile: filePath!, atomically: true)
        }
        

    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

