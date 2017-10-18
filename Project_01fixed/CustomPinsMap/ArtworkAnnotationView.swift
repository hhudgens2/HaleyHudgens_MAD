//
//  ArtworkAnnotationView.swift
//  artPub
//
//  Created by Haley  Hudgens  on 10/4/17.
//  Copyright © 2017 HaleyHudgens. All rights reserved.
//

import UIKit
import MapKit

private let ArtworkMapPinImage = UIImage(named: "mapPin")!
private let ArtworkMapAnimationTime = 0.300


//creates pins on map
//contorls tap interactions
class ArtworkAnnotationView: MKAnnotationView {
    // data
    weak var artworkDetailDelegate: ArtworkDetailMapViewDelegate?
    weak var customCalloutView: ArtworkDetailMapView?
    override var annotation: MKAnnotation? {
        willSet { customCalloutView?.removeFromSuperview() }
    }
    
  
    
    
    //disables default callout method--sets a customized pin
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        self.canShowCallout = false
        self.image = ArtworkMapPinImage
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.canShowCallout = false
        self.image = ArtworkMapPinImage
    }
    
    
    //handles the callout and hiding of cutsom annotation view
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            //stores custom callout view in an instance variabel called customCalloutVieww
            //uses method loadPersonDetailMapView
            //remove default call out view
            self.customCalloutView?.removeFromSuperview()
            
            if let newCustomCalloutView = loadArtworkDetailMapView() {
                // fix location
                newCustomCalloutView.frame.origin.x -= newCustomCalloutView.frame.width / 2.0 - (self.frame.width / 2.0)
                newCustomCalloutView.frame.origin.y -= newCustomCalloutView.frame.height
                
                // set custom callout view
                self.addSubview(newCustomCalloutView)
                self.customCalloutView = newCustomCalloutView
            
                // animate presentation
                if animated {
                    self.customCalloutView!.alpha = 0.0
                    UIView.animate(withDuration: ArtworkMapAnimationTime, animations: {
                        self.customCalloutView!.alpha = 1.0
                    })
                }
            }
        } else {
            if customCalloutView != nil { //deslects custom call out view 
                if animated {
                    //animations of callout view
                    UIView.animate(withDuration: ArtworkMapAnimationTime, animations: {
                        self.customCalloutView!.alpha = 0.0
                    }, completion: { (success) in
                        self.customCalloutView!.removeFromSuperview()
                    })
                } else { self.customCalloutView!.removeFromSuperview() }
            }
        }
    }
    
    func loadArtworkDetailMapView() -> ArtworkDetailMapView? {
        if let views = Bundle.main.loadNibNamed("ArtworkDetailMapView", owner: self, options: nil) as? [ArtworkDetailMapView], views.count > 0 {
            let artworkDetailMapView = views.first!
            artworkDetailMapView.delegate = self.artworkDetailDelegate
            if let artworkAnnotation = annotation as? ArtworkAnnotation {
                let artwork = artworkAnnotation.artwork
                artworkDetailMapView.configureWithArtwork(artwork: artwork)
            }
            return artworkDetailMapView
        }
        return nil
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.customCalloutView?.removeFromSuperview()
    }
    
    //hit test ot taps when user presses the button
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if let parentHitView = super.hitTest(point, with: event) { return parentHitView }
        else { 
            if customCalloutView != nil {
                return customCalloutView!.hitTest(convert(point, to: customCalloutView!), with: event)
            } else { return nil }
        }
    }
}
