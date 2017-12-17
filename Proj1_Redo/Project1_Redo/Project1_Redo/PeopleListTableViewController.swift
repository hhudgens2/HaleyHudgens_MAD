//
//  PeopleListTableViewController.swift
//  Project1_Redo
//
//  Created by Haley  Hudgens  on 12/7/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class PeopleListTableViewController: UITableViewController {
    var people = [People]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPeopleData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
    
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return people.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "PeopleListTableViewCell"

        gaurd let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as PeopleListTableViewCell?; else {
            fatalError("The dequeued cell is not an instance of PeopleListTableViewCell.")
            }
            let person = people[indexPath.row]
                
        cell.nameLabel.text = person.name
        cell.dateLabel.text = person.date
        
            
.

        return cell
    }
  

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    private func loadPeopleData() {
        guard let person1 = People(name: "Bailey Martin", description: "move in", date: "July 4th, 2015" ) else {
            fatalError("Unable to instantiate person1")
        }
        
        guard let person2 = People(name: "Sam Maxwell", description: "kindergarten", date: "August 25th, 2002" ) else {
            fatalError("Unable to instantiate person2")
        }
        
        guard let person3 = People(name: "Ryan Dittmar", description: "highschool", date: "August 20th, 2010" ) else {
            fatalError("Unable to instantiate person3")
        }
        
        people += [person1, person2, person3]
    }

}
