//
//  TTGoogleMapMarker.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 3/14/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import Foundation
import GoogleMaps

class TTGoogleMapMarker: GMSMarker {
    
    var place: Place?
    
    func removeFromMap() {
        map = nil
    }
    
    func insertCustomView(_ customView: UIView) {
        iconView = customView
    }
    
}

extension TTGoogleMapMarker {
    
    class func MarkerFromPlace(_ place: Place) -> TTGoogleMapMarker {
        let marker = TTGoogleMapMarker(position: CLLocationCoordinate2D(latitude: place.latitude, longitude: place.longitude))
        marker.place = place
        marker.icon = GMSMarker.markerImage(with: place.iconColor)
        return marker
    }
    
}
