//
//  PeopleTableViewController.swift
//  Project1_Redo
//
//  Created by Haley  Hudgens  on 12/8/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

//var names = ["Sam Maxwell" , "Bailey Martin"]
//var des = ["preschool", "roomate"]
var myIndex = 0

class PeopleTableViewController: UITableViewController {
    
  
    
    var user = People()
    var names = String()
    var names1 = [String]()
    var des1 = [String]()
    var date1 = [String]()

//    @IBAction func unwindInfoSegue(_ segue:UIStoryboardSegue){
//    
//    }
    @IBAction func unwindAddSegue(_ segue:UIStoryboardSegue){
        insertPersonInfo()
        print(names1)
        print(names)
      
        
    }
    
    
    func insertPersonInfo() {
       

        //add titles to array
        names1.append(user.addName!)
        des1.append(user.addDes!)
        date1.append(user.addDate!)
        
        //where to put this in table view--create index path(row of table view) created at  bottom
        let indexPath = IndexPath(row: names1.count - 1, section: 0)
        
        //update table views
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names1.count

    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = names1[indexPath.row]

        return cell
    }
    
    //make cells buttons
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        performSegue(withIdentifier: "infoSegue" , sender: self)
    }


    

}
