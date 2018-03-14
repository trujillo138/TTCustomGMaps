//
//  GoogleMapManager.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 3/1/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import Foundation
import GoogleMaps

protocol GoogleMapManagerHandler {
    
    var mapManager: GoogleMapManager? { get set }
    
}

class GoogleMapManager {
    
    func startGoogleMapsServices(withKey key: String) {
        GMSServices.provideAPIKey(key)
    }
    
    func setGoogleMap(inView view: UIView) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.mapStyle = try! GMSMapStyle(jsonString: getCustomMapStyleInJSONString())
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        NSLayoutConstraint.activate([mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     mapView.topAnchor.constraint(equalTo: view.topAnchor),
                                     mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        view.setNeedsLayout()
        return mapView
        
    }
    
}

extension GoogleMapManager {
    
    func getCustomMapStyleInJSONString() -> String {
        return """
                    [
                    {
                    \"elementType\": \"geometry\",
                    \"stylers\": [
                    {
                    \"color\": \"#1d2c4d\"
                    }
                    ]
                    },
                    {
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#8ec3b9\"
                    }
                    ]
                    },
                    {
                    \"elementType\": \"labels.text.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#1a3646\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"administrative.country\",
                    \"elementType\": \"geometry.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#4b6878\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"administrative.land_parcel\",
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#64779e\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"administrative.neighborhood\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"administrative.province\",
                    \"elementType\": \"geometry.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#4b6878\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"landscape.man_made\",
                    \"elementType\": \"geometry.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#334e87\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"landscape.natural\",
                    \"elementType\": \"geometry\",
                    \"stylers\": [
                    {
                    \"color\": \"#023e58\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"poi\",
                    \"elementType\": \"geometry\",
                    \"stylers\": [
                    {
                    \"color\": \"#283d6a\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"poi\",
                    \"elementType\": \"labels.text\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"poi\",
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#6f9ba5\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"poi\",
                    \"elementType\": \"labels.text.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#1d2c4d\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"poi.business\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"poi.park\",
                    \"elementType\": \"geometry.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#023e58\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"poi.park\",
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#3C7680\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road\",
                    \"elementType\": \"geometry\",
                    \"stylers\": [
                    {
                    \"color\": \"#304a7d\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road\",
                    \"elementType\": \"labels\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road\",
                    \"elementType\": \"labels.icon\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road\",
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#98a5be\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road\",
                    \"elementType\": \"labels.text.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#1d2c4d\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road.arterial\",
                    \"elementType\": \"labels\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road.highway\",
                    \"elementType\": \"geometry\",
                    \"stylers\": [
                    {
                    \"color\": \"#2c6675\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road.highway\",
                    \"elementType\": \"geometry.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#255763\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road.highway\",
                    \"elementType\": \"labels\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road.highway\",
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#b0d5ce\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road.highway\",
                    \"elementType\": \"labels.text.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#023e58\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"road.local\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"transit\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"transit\",
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#98a5be\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"transit\",
                    \"elementType\": \"labels.text.stroke\",
                    \"stylers\": [
                    {
                    \"color\": \"#1d2c4d\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"transit.line\",
                    \"elementType\": \"geometry.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#283d6a\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"transit.station\",
                    \"elementType\": \"geometry\",
                    \"stylers\": [
                    {
                    \"color\": \"#3a4762\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"water\",
                    \"elementType\": \"geometry\",
                    \"stylers\": [
                    {
                    \"color\": \"#0e1626\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"water\",
                    \"elementType\": \"labels.text\",
                    \"stylers\": [
                    {
                    \"visibility\": \"off\"
                    }
                    ]
                    },
                    {
                    \"featureType\": \"water\",
                    \"elementType\": \"labels.text.fill\",
                    \"stylers\": [
                    {
                    \"color\": \"#4e6d70\"
                    }
                    ]
                    }
                    ]
                """
    }
    
}
