//
//  ArtworksManager.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit
import CoreLocation

// using sigleton implementatino so only one instance of this class is initiated--gaining global access
private let _singletonInstance = ArtworksManager()

private let ArtworksNumberOfArt = 5

class ArtworksManager: NSObject {
    // shared instance of ArtworksManager.
    class var sharedInstance: ArtworksManager { return _singletonInstance }
    
    // artworks array
    var artworks = [Artwork]()
    
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
                            "A bronze sculpture of a hawk in flight on Pearl street mall. Located in the Boulder County Courthouse Plaza. The symbols on the side of the relief reflects our county's history and its strength of will to survive",
                            "On the backside of a restaurant, this takes up the entire backside of the building.",
                            "A large mural of runners and the flatirons."]
        
        let coordinates = [
            CLLocationCoordinate2D(latitude: 40.017736, longitude: -105.280867),
            CLLocationCoordinate2D(latitude: 40.016844, longitude: -105.283306),
            CLLocationCoordinate2D(latitude: 40.018365, longitude: -105.278757),
            CLLocationCoordinate2D(latitude: 40.017674, longitude: -105.281217),
            CLLocationCoordinate2D(latitude: 40.019046, longitude:  -105.280219),
        ]
        
        
        //iterate through items in array
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
    

}
