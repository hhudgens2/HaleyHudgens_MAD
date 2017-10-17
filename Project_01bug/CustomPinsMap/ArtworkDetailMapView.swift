//
//  ArtworkDetailMapView.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit

protocol ArtworkDetailMapViewDelegate: class {
    func detailsRequestedForArtwork(artwork: Artwork)
}

class ArtworkDetailMapView: UIView, UITableViewDelegate, UITableViewDataSource {
    // outlets
    @IBOutlet weak var backgroundContentButton: UIButton!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var artworkTitle: UILabel!
    @IBOutlet weak var seeDetailsButton: UIButton!
    @IBOutlet weak var artworkArtist: UILabel!
    @IBOutlet weak var wishListTableView: UITableView!

    
    // data
    var artwork: Artwork!
    var delegate: ArtworkDetailMapViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
         //setup list
        
        wishListTableView.register(UINib(nibName: "ArtworkItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ArtworkItemTableViewCell")
        wishListTableView.delegate = self
        wishListTableView.dataSource = self

      //appearance
        backgroundContentButton.applyArrowDialogAppearanceWithOrientation(arrowOrientation: .down)
    }
    
    @IBAction func seeDetails(_ sender: Any) {
        delegate?.detailsRequestedForArtwork(artwork: artwork)
    }
    
    func configureWithArtwork(artwork: Artwork) {
        self.artwork = artwork
        artworkImageView.image = artwork.image
        artworkTitle.text = artwork.title
        artworkArtist.text = artwork.title
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artwork?.wishList.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtworkItemTableViewCell", for: indexPath) as! ArtworkItemTableViewCell
        
        if let item = artwork?.wishList[indexPath.row] { cell.configureWithItem(item: item) }
        
        return cell
    }

    
    
    // MARK: - Hit test. We need to override this to detect hits in our custom callout.
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        // Check if it hit our annotation detail view components.

        // details button
        if let result = seeDetailsButton.hitTest(convert(point, to: seeDetailsButton), with: event) {
            return result
        }

        // fallback to our background content view
        return backgroundContentButton.hitTest(convert(point, to: backgroundContentButton), with: event)
    }
 
}
