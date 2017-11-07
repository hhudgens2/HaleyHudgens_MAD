//
//  ArtworkDetailsViewController.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

class ArtworkDetailsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    // outlets
    
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var mediumType: UILabel!
    @IBOutlet weak var collectionType: UILabel!
    @IBOutlet weak var artDescription: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var wishListTableView: UITableView!
   
    
    // data
    var artwork: Artwork?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // adapted from code to get data to go from ViewController to ArtworkDetailsMap 
        wishListTableView.register(UINib(nibName: "ArtworkItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ArtworkItemTableViewCell")

    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        if artwork != nil {
            artworkImageView.image = artwork!.image
            titleLabel.text = artwork!.title
            artistName.text = artwork!.artist
            mediumType.text = artwork!.medium
            collectionType.text = artwork!.collection
            artDescription.text = artwork!.artDescription
            wishListTableView.reloadData()
        }
    }

    @IBAction func goBack(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }

    //  UITableViewDelegate/DataSource methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artwork?.wishList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtworkItemTableViewCell", for: indexPath) as! ArtworkItemTableViewCell
        
        if let item = artwork?.wishList[indexPath.row] { cell.configureWithItem(item: item) }
        
        return cell
    }
    
}
