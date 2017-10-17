//
//  ViewController.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit
import MapKit

private let ArtworkAnnotationName = "ArtworkAnnotationName"

class ViewController: UIViewController, MKMapViewDelegate, ArtworkDetailMapViewDelegate {
    // outlets
    @IBOutlet weak var mapView: MKMapView!
    
    
    // data
    var selectedArtwork: Artwork?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureArtworksInMap()
        setFakeUserPosition()
    }
    
    func configureArtworksInMap() {
        var annotations = [MKAnnotation]()
        for artwork in ArtworksManager.sharedInstance.artworks {
            let annotation = ArtworkAnnotation(artwork: artwork)
            annotations.append(annotation)
        }
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }

    func setFakeUserPosition() {
        let visibleRegion = MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D(latitude: 40.017938, longitude: -105.279720), 500, 500)
        self.mapView.setRegion(self.mapView.regionThatFits(visibleRegion), animated: true)
    }
    
    // MKMapViewDelegate methods
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        let visibleRegion = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 500, 500)
        self.mapView.setRegion(self.mapView.regionThatFits(visibleRegion), animated: true)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: ArtworkAnnotationName)
        
        if annotationView == nil {
            annotationView = ArtworkAnnotationView(annotation: annotation, reuseIdentifier: ArtworkAnnotationName)
            (annotationView as! ArtworkAnnotationView).artworkDetailDelegate = self
        } else {
            annotationView!.annotation = annotation
        }
        
        return annotationView
        
    }
    
    // MARK: - Selecting an artwork and seguing to details
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let advc = segue.destination as? ArtworkDetailsViewController {
            advc.artwork = self.selectedArtwork
        }
    }
    
    func detailsRequestedForArtwork(artwork: Artwork) {
        self.selectedArtwork = artwork
        self.performSegue(withIdentifier: "artworkDetails", sender: nil)
    }
}

