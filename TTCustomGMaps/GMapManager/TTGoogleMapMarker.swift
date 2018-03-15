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
    
    func changeColor() {
        let rnd = arc4random_uniform(5)
        var color = UIColor.black
        switch rnd {
        case 0:
            color = .red
            iconView = nil
        case 1:
            color = .yellow
            iconView = nil
        case 2:
            color = .cyan
            iconView = nil
        case 3:
            color = .blue
            iconView = nil
        case 4:
            insertCustomImage()
        case 5:
            color = .black
            iconView = nil
        default:
            break
        }
        icon = GMSMarker.markerImage(with: color)
    }
    
    func insertCustomImage() {
        let square = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: 20.0))
        square.backgroundColor = UIColor.orange
        square.layer.cornerRadius = 5
        square.layer.masksToBounds = true
        iconView = square
    }
    
}
