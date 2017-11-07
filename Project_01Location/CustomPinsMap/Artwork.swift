//
//  Artwork.swift
//  arPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit
import CoreLocation

class Artwork: NSObject {
    var title: String
    var artist: String
    var medium: String
    var collection: String
    var artDescription: String
    var image: UIImage
    var wishList =  [String]()
    
    var location: CLLocationCoordinate2D = kCLLocationCoordinate2DInvalid
    
    init(title: String, artist: String, medium: String, collection: String, artDescription: String, image: UIImage) {
        self.title = title
        self.artist = artist
        self.medium = medium
        self.collection = collection
        self.artDescription = artDescription
        self.image = image

    }
}
