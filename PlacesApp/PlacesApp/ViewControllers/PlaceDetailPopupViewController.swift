//
//  PlaceDetailPopupViewController.swift
//  PlacesApp
//
//  Created by Burhan on 28/07/2018.
//  Copyright © 2018 Burhan. All rights reserved.
//

import UIKit
import MapKit

class PlaceDetailPopupViewController: BaseViewController, MKMapViewDelegate {
    
    var venue: VenueModel?
    
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var venueImageView: BaseImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.popupShowAnimation()
    }
    
    
    override func initialize() {
        
        self.mapView.delegate = self
        
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: self.venue?.location?.lat ?? 41, longitude:self.venue?.location?.lng ?? 29)
        annotation.coordinate = centerCoordinate
        annotation.title = self.venue?.name
        self.mapView.addAnnotation(annotation)
        
        var mapRegion = MKCoordinateRegion()
        mapRegion.center = centerCoordinate
        mapRegion.span.latitudeDelta = 0.2;
        mapRegion.span.longitudeDelta = 0.2;
        self.mapView.setRegion(mapRegion, animated: true)
        
        if let suffix = self.venue?.bestPhoto?.suffix, let prefix = self.venue?.bestPhoto?.prefix{
            let imageUrlString = suffix + prefix
            self.venueImageView.loadImage(url: imageUrlString)
        }
        
    }
    
    func popupShowAnimation() {
        
        self.backgroundView.alpha = 0
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.6
        }
    }
    
    func popupDismissAnimation() {
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0
        }
        
        self.dismissViewController()
    }

    @IBAction func backgroundButtonAction(_ sender: Any) {
        
        self.popupDismissAnimation()
    }
    

}
