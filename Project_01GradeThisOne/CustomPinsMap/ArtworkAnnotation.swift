//
//  ArtworkAnnotation.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit
import MapKit

class ArtworkAnnotation: NSObject, MKAnnotation {
    var artwork: Artwork
    var coordinate: CLLocationCoordinate2D { return artwork.location }
    
    init(artwork: Artwork) {
        self.artwork = artwork
        super.init()
    }
    
    var title: String? {
        return artwork.title
    }
    
}
