//
//  ArtworksManager.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit
import CoreLocation

// quick singleton implementation for our ArtworkManager.
private let _singletonInstance = ArtworksManager()

private let ArtworksNumberOfArt = 5

class ArtworksManager: NSObject {
    // shared instance of ArtworksManager.
    class var sharedInstance: ArtworksManager { return _singletonInstance }
    
    // people wishlist
    var artworks = [Artwork]()
    
    // MARK: - init
    override init() {
        super.init()
        loadArtworksList()
    }

    func loadArtworksList() {
        let titles = ["Passage Between Rocks", "Metal Sculpture Collage ", "Messenger of the Skies", "Eternal Solitude", "Running Mural"]
        
        let artists = ["unkown", "unknown", "Joellen Domenico", "unknown", "unknown"]
        
        
        let mediums = ["Sculpture, Ecoart", "sculpture", "Statue", "mural", "mural"]
        
        let collections = ["Pearl street", "Downtown Boulder", "Pearl Street", "Pearl and 11th", "Spruce and Broadway"]
        
        
        let artDescriptions = ["Passage between rocks on the Pearl St. mall.",
                            "Metal Sculpture",
                            "A bronze sculpture of a hawk in flight on Pearl street mall. Located in the Boulder County Courthouse Plaza. The symbols on the side of the relief--reflects our county's history and its strength of will to survive,--according to the plaque.Commissioned to recognize Boulder County's 150th Anniversary.",
                            "On the backside of a restaurant, this takes up the entire backside of the building.",
                            "A large mural of runners and the flatirons."]
        
        let coordinates = [
            CLLocationCoordinate2D(latitude: 40.017736, longitude: -105.280867),
            CLLocationCoordinate2D(latitude: 40.016844, longitude: -105.283306),
            CLLocationCoordinate2D(latitude: 40.018365, longitude: -105.278757),
            CLLocationCoordinate2D(latitude: 40.017674, longitude: -105.281217),
            CLLocationCoordinate2D(latitude: 40.019046, longitude:  -105.280219),
        ]
        
        artworks = []
        for i in 0..<ArtworksNumberOfArt {
            let title = titles[i]
            let artist = artists[i]
            let medium = mediums[i]
            let collection = collections[i]
            let artDescription = artDescriptions[i]
            let image = UIImage(named: "image\(i+1)")!
            
            let artwork = Artwork(title: title, artist: artist, medium: medium, collection: collection, artDescription: artDescription, image: image)
            artwork.location = coordinates[i]
            artworks.append(artwork)
        }
    }
    
    func giveMeAWishList() -> [String] {
        let items = ["Remote control", "Soda", "Barbie doll", "Watch", "Purple pen", "Dollar Bill", "stuffed animal", "Hair clip", "Sun glasses", "T shirt", "Purse", "Towel", "Hat", "Camera", "Hand sanitizer bottle", "Porcelian Budda", "Photo", "dog bone", "Hair brush", "Birthday card", "socks", "shoes", "stuffed monkey", "bag of chips", "ELEPHANT", "snapple", "tweezers", "laptop", "lemon", "apple", "mango", "watermelon", "daisy dukes", "basset hound/labrador", "video casette", "candy bar", "yourself", "radio", "keys", "eggs", "duck", "bottle of perfume"]
        
        let num = arc4random_uniform(3) + 1
        var wishlist = [String]()
        for _ in 0..<num {
            let index = Int(arc4random_uniform(UInt32(items.count)))
            wishlist.append(items[index])
        }
        return wishlist
    }
}
