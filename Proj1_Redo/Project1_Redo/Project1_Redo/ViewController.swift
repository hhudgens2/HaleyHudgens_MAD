//
//  ViewController.swift
//  Project1_Redo
//
//  Created by Haley  Hudgens  on 12/5/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation



class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate{

  
    @IBOutlet weak var tableView: UITableView!
    
    var user = People()
    var names1 = [String]()
    var des1 = [String]()
    var dates1 = [String]()
    
  

    //unwind segue user input page
    @IBAction func unwindSegue(_ segue:UIStoryboardSegue){
        insertPersonInfo()
        for element in names1 {
            print(element)
        }
        for element in dates1 {
            print(element)
        }
        for element in des1 {
            print(element)
        }
    }
    
    @IBAction func unwindInfoSegue(_ segue:UIStoryboardSegue){
    }
    
    @IBAction func unwindInputSegue(_ segue:UIStoryboardSegue){
    }

    
    func insertPersonInfo() {
        //add titles to array
        names1.append(user.addName!)
        des1.append(user.addDes!)
        dates1.append(user.addDate!)
        
        //where to put this in table view--create index path(row of table view) created at  bottom
        let indexPath = IndexPath(row: names1.count - 1, section: 0)
        
        //update table views
        tableView.beginUpdates()
        tableView.insertRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }

 
   
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        //this hides the cells that are not being used
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.rowHeight = 70
        
       
        }

    //normal tableView Functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PersonTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "PeopleCell") as! PersonTableViewCell
        cell.personName.text = names1[indexPath.row]
        cell.meetDate.text = dates1[indexPath.row]
        print("indexPath.row =", indexPath.row)
        return cell
    }
    
    // segue from selected table view cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.row)!")
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    //send table view cell information to peopleinfoviewcontroller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        print("person segue has been called")
        if segue.identifier == "personInfo" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let selectedRow = indexPath.row
                let peopleInfoVC = segue.destination as! PeopleInfoViewController
                peopleInfoVC.getName = self.names1[selectedRow]
                peopleInfoVC.getDate = self.dates1[selectedRow]
                peopleInfoVC.getDes = self.des1[selectedRow]
            }
        }
    }

    
    
    
    //deleting Rows
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            self.names1.remove(at: indexPath.row)
            self.dates1.remove(at: indexPath.row)
            self.des1.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// code for the table view https://www.youtube.com/watch?v=fFpMiSsynXM
//code that kind of helped me use a show segue form table view http://www.codingexplorer.com/segue-uitableviewcell-taps-swift/

