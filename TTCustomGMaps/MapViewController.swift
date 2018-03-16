//
//  MapViewController.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 3/7/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import UIKit
import GoogleMaps

class MapViewController: UIViewController, GoogleMapManagerHandler {

    //MARK: Properties
    
    var mapManager: GoogleMapManager?
    
    var mapView: GMSMapView?
    
    //MARK: Viewcontroller Lifecycl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGoogleMap()
    }
    
    private func loadGoogleMap() {
        let latitude = 4.6951199
        let longitude = -74.030881
        self.mapView = mapManager?.setGoogleMap(inView: self.view, latitude: latitude, longitude: longitude)
    }

}
