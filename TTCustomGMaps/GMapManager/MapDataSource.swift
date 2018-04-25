//
//  MapDataSource.swift
//  TTCustomGMaps
//
//  Created by Tomas Trujillo on 3/16/18.
//  Copyright © 2018 TomApps. All rights reserved.
//

import Foundation
import GoogleMaps

class MapDataSource: TTMapDataSource {
    
    func mapViewMarkersForPostion(mapView: GMSMapView, latitude: Double, longitude: Double, zoom: Float, response: ([GMSMarker]) -> ()) {
        if (longitude >= -74.0315547958016 && longitude <= -74.0297208353877) && (latitude >= 4.6 && latitude <= 4.7) {
            response(mockDataForUsaquen())
        } else if (longitude >= -74.0567119047046 && longitude <= -74.0529256314039) && (latitude >= 4.6 && latitude <= 4.7) {
            response(mockDataForG())
        }
        else {
            response([])
        }
    }
    
}

//MARK: Mock
extension MapDataSource {
    
    private func mockDataForUsaquen() -> [GMSMarker] {
        var markers: [GMSMarker] = []
        let starbucksMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6948014, longitude: -74.0314367))
        starbucksMarker.icon = GMSMarker.markerImage(with: .green)
        let misterRibsMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.695352, longitude: -74.0312434))
        misterRibsMarker.icon = GMSMarker.markerImage(with: .yellow)
        let laMarMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6953995, longitude: -74.0306507))
        laMarMarker.icon = GMSMarker.markerImage(with: .blue)
        let inkasMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6955998, longitude: -74.030485))
        inkasMarker.icon = GMSMarker.markerImage(with: .red)
        let biconoMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6952293, longitude: -74.0317908))
        biconoMarker.icon = GMSMarker.markerImage(with: .cyan)
        let teEncantareMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6944422, longitude: -74.0311205))
        teEncantareMarker.icon = GMSMarker.markerImage(with: .brown)
        let rodizioMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6950682, longitude: -74.0303037))
        rodizioMarker.icon = GMSMarker.markerImage(with: .orange)
        markers.append(starbucksMarker)
        markers.append(misterRibsMarker)
        markers.append(laMarMarker)
        markers.append(inkasMarker)
        markers.append(biconoMarker)
        markers.append(teEncantareMarker)
        markers.append(rodizioMarker)
        return markers
    }
    
    private func mockDataForG() -> [GMSMarker] {
        var markers: [GMSMarker] = []
        let gordoMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6498152, longitude: -74.0555161))
        gordoMarker.icon = GMSMarker.markerImage(with: .green)
        let criterionRibsMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6511724, longitude: -74.0558309))
        criterionRibsMarker.icon = GMSMarker.markerImage(with: .yellow)
        let crepesMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6514093, longitude: -74.0560993))
        crepesMarker.icon = GMSMarker.markerImage(with: .blue)
        let diaQueMeQuierasMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.651040, longitude: -74.0558142))
        diaQueMeQuierasMarker.icon = GMSMarker.markerImage(with: .red)
        let divinaComediaMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.652771, longitude: -74.0554828))
        divinaComediaMarker.icon = GMSMarker.markerImage(with: .cyan)
        let aguaPatosMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6538533, longitude: -74.0546959))
        aguaPatosMarker.icon = GMSMarker.markerImage(with: .brown)
        let homeBurgersMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: 4.6525965, longitude: -74.0550032))
        homeBurgersMarker.icon = GMSMarker.markerImage(with: .orange)
        markers.append(gordoMarker)
        markers.append(criterionRibsMarker)
        markers.append(crepesMarker)
        markers.append(diaQueMeQuierasMarker)
        markers.append(divinaComediaMarker)
        markers.append(aguaPatosMarker)
        markers.append(homeBurgersMarker)
        return markers
    }
    
}
