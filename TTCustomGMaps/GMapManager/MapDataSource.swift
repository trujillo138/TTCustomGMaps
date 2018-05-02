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
    
    func mapViewMarkersForPostion(mapView: GMSMapView, latitude: Double, longitude: Double, zoom: Float, response: ([TTGoogleMapMarker]) -> ()) {
        if (longitude >= -74.0315547958016 && longitude <= -74.0297208353877) && (latitude >= 4.6 && latitude <= 4.7) {
            var markers: [TTGoogleMapMarker] = []
            for place in mockDataForUsaquen() {
                markers.append(TTGoogleMapMarker.MarkerFromPlace(place))
            }
            response(markers)
        } else if (longitude >= -74.0567119047046 && longitude <= -74.0529256314039) && (latitude >= 4.6 && latitude <= 4.7) {
            var markers: [TTGoogleMapMarker] = []
            for place in mockDataForG(){
                markers.append(TTGoogleMapMarker.MarkerFromPlace(place))
            }
            response(markers)
        }
        else {
            response([])
        }
    }
    
}

//MARK: Mock
extension MapDataSource {
    
    private func mockDataForUsaquen() -> [Place] {
        var places: [Place] = []
        let starbucksPlace = Place(imageURL: "mapCircle", name: "Starbucks", score: 4, description: "A place to come and drink a nice cup of coffee.",
                                   latitude: 4.6948014, longitude: -74.0314367, iconColor: .green)
        let misterRibsPlace = Place(imageURL: "mapHeartIcon", name: "Mister ribs", score: 3, description: "Find the best ribs in town here.",
                                    latitude: 4.695352, longitude: -74.0312434, iconColor: .yellow)
        let laMarPlace = Place(imageURL: "mapImage", name: "La Mar", score: 5, description: "Delicious Peruvian cooked in the best place of town.",
                               latitude: 4.6953995, longitude: -74.0306507, iconColor: .blue)
        let inkasPlace = Place(imageURL: "mapImage2", name: "14 Inkas", score: 2, description: "Not so good peruvian food.",
                               latitude: 4.6955998, longitude: -74.030485, iconColor: .red)
        let biconoPlace = Place(imageURL: "mapYellowImage", name: "Bicono", score: 4, description: "Great place to stop by and eat a nice burger.",
                                latitude: 4.6952293, longitude: -74.0317908, iconColor: .cyan)
        let teEncantarePlace = Place(imageURL: "photoIcon", name: "Te Encantaré", score: 1, description: "Drink nice cocktails while eating some nice appetizers.",
                                     latitude: 4.6944422, longitude: -74.0311205, iconColor: .brown)
        let rodizioPlace = Place(imageURL: "mapCircle", name: "Rodizio", score: 2, description: "Eat as much meat as you want.",
                                 latitude: 4.6950682, longitude: -74.0303037, iconColor: .orange)
        places.append(starbucksPlace)
        places.append(misterRibsPlace)
        places.append(laMarPlace)
        places.append(inkasPlace)
        places.append(biconoPlace)
        places.append(teEncantarePlace)
        places.append(rodizioPlace)
        return places
    }
    
    private func mockDataForG() -> [Place] {
        var places: [Place] = []
        let gordoPlace = Place(imageURL: "mapCircle", name: "Gordo", score: 5, description: "Eat meatty hamburgers with beer.",
                               latitude: 4.6498152, longitude: -74.0555161, iconColor: .green)
        let criterionPlace = Place(imageURL: "mapHeartIcon", name: "Criterion", score: 1, description: "Expensive place to spend family quality time.",
                                   latitude: 4.6511724, longitude: -74.0558309, iconColor: .yellow)
        let crepesPlace = Place(imageURL: "mapImage", name: "Crepes artesano", score: 4, description: "Healthy and tasty food.",
                                latitude: 4.6514093, longitude: -74.0560993, iconColor: .blue)
        let diaQueMeQuierasPlace = Place(imageURL: "mapImage2", name: "El Día que me Quieras", score: 3, description: "Eat a lot for not much.",
                                         latitude: 4.651040, longitude: -74.0558142, iconColor: .red)
        let divinaComediaPlace = Place(imageURL: "mapYellowImage", name: "La Divina Comedia", score: 5, description: "Delicious Italian food.",
                                       latitude: 4.652771, longitude: -74.0554828, iconColor: .cyan)
        let aguaPatosPlace = Place(imageURL: "photoIcon", name: "Al Agua Patos", score: 3, description: "Innovative food with a great variety.",
                                   latitude: 4.6538533, longitude: -74.0546959, iconColor: .brown)
        let homeBurgerPlace = Place(imageURL: "mapCircle", name: "Home Burger", score: 5, description: "Delicious home-made burgers.",
                                    latitude: 4.6525965, longitude: -74.0550032, iconColor: .orange)
        
        places.append(gordoPlace)
        places.append(criterionPlace)
        places.append(crepesPlace)
        places.append(diaQueMeQuierasPlace)
        places.append(divinaComediaPlace)
        places.append(aguaPatosPlace)
        places.append(homeBurgerPlace)
        return places
    }
    
}
