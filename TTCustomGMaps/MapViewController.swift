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
    
    var marker: TTGoogleMapMarker?
    
    //MARK: Viewcontroller Lifecycl
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadGoogleMap()
    }
    
    private func loadGoogleMap() {
        mapView = mapManager?.setGoogleMap(inView: self.view)
        mapView?.moveCamera(GMSCameraUpdate.setTarget(CLLocationCoordinate2D(latitude: 10, longitude: 10)))
    }
    
    @IBAction func tappedMap() {
        if let m = marker {
            m.changeColor()
        } else {
            let position = CLLocationCoordinate2D(latitude: 10, longitude: 10)
            let marker = TTGoogleMapMarker(position: position)
            marker.title = "My first marker"
            marker.appearAnimation = .pop
            marker.map = mapView
            self.marker = marker
        }
    }


}
