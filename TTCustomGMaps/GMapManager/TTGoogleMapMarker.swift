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
    
    func removeFromMap() {
        map = nil
    }
    
    func insertCustomView(_ customView: UIView) {
        iconView = customView
    }
    
}
