//
//  MapViewController.swift
//  ProviderIos
//
//  Created by Fullname on 10/18/18.
//  Copyright © 2018 Fullname. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {

    
    @IBOutlet weak var myMapView: MKMapView!
     let initialLocation = CLLocation(latitude: 21.028511, longitude: 105.804817)
    override func viewDidLoad() {
        super.viewDidLoad()
        centerMapOnLocation(location: initialLocation)
     
    }
    
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius, regionRadius)
        myMapView.setRegion(coordinateRegion, animated: true)
    }



}
