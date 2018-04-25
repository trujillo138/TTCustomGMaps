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

protocol TTMapDataSource {
    
    func mapViewMarkersForPostion(mapView: GMSMapView, latitude: Double, longitude: Double, zoom: Float, response: ([GMSMarker]) -> ())
    
}

class GoogleMapManager: NSObject {
    
    private var defaultZoom: Float = 0
    
    var infoWindow: MapInfoView?
    
    var dataSource: TTMapDataSource?
    
    func startGoogleMapsServices(withKey key: String, zoom: Float = 15) {
        GMSServices.provideAPIKey(key)
        defaultZoom = zoom
    }
    
    func setGoogleMap(inView view: UIView, latitude: Double, longitude: Double) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: defaultZoom)
        let mapView = GMSMapView.map(withFrame: .zero, camera: camera)
        mapView.mapStyle = try? GMSMapStyle(jsonString: getCustomMapStyleInJSONString())
        mapView.delegate = self
        dataSource = MapDataSource()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(mapView, at: 0)
        NSLayoutConstraint.activate([mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     mapView.topAnchor.constraint(equalTo: view.topAnchor),
                                     mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        view.setNeedsLayout()
        return mapView
    }
    
    private func movedMapToPostion(mapView: GMSMapView, position: GMSCameraPosition) {
        if mapView.selectedMarker == nil {
            dataSource?.mapViewMarkersForPostion(mapView: mapView, latitude: position.target.latitude, longitude: position.target.longitude,
                                                 zoom: position.zoom) { markers in
                                                    mapView.clear()
                                                    for marker in markers {
                                                        marker.appearAnimation = .pop
                                                        marker.map = mapView
                                                    }
            }
        }
    }
    
}

extension GoogleMapManager: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        movedMapToPostion(mapView: mapView, position: position)
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        infoWindow?.removeFromSuperview()
        let location = marker.position
        var center = mapView.projection.point(for: location)
        let view = MapInfoView(frame: CGRect(origin: .zero, size: CGSize(width: 230, height: 175)))
        self.centerMapInPoint(center, inMapView: mapView)
        center = mapView.projection.point(for: location)
        view.center = CGPoint(x: center.x, y: center.y - 125)
        mapView.addSubview(view)
        self.infoWindow = view
        return true
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        infoWindow?.removeFromSuperview()
    }
    
    private func centerMapInPoint(_ point: CGPoint, inMapView mapView: GMSMapView) {
        let target = mapView.projection.coordinate(for: point)
        let update = GMSCameraUpdate.setCamera(GMSCameraPosition(target: target, zoom: mapView.camera.zoom,
                                                                 bearing: mapView.camera.bearing, viewingAngle: mapView.camera.viewingAngle))
        mapView.moveCamera(update)
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
                \"color\": \"#212121\"
                }
                ]
                },
                {
                \"elementType\": \"labels.icon\",
                \"stylers\": [
                {
                \"visibility\": \"off\"
                }
                ]
                },
                {
                \"elementType\": \"labels.text.fill\",
                \"stylers\": [
                {
                \"color\": \"#757575\"
                }
                ]
                },
                {
                \"elementType\": \"labels.text.stroke\",
                \"stylers\": [
                {
                \"color\": \"#212121\"
                }
                ]
                },
                {
                \"featureType\": \"administrative\",
                \"elementType\": \"geometry\",
                \"stylers\": [
                {
                \"color\": \"#757575\"
                }
                ]
                },
                {
                \"featureType\": \"administrative.country\",
                \"elementType\": \"labels.text.fill\",
                \"stylers\": [
                {
                \"color\": \"#9e9e9e\"
                }
                ]
                },
                {
                \"featureType\": \"administrative.land_parcel\",
                \"stylers\": [
                {
                \"visibility\": \"off\"
                }
                ]
                },
                {
                \"featureType\": \"administrative.locality\",
                \"elementType\": \"labels.text.fill\",
                \"stylers\": [
                {
                \"color\": \"#bdbdbd\"
                }
                ]
                },
                {
                \"featureType\": \"poi\",
                \"elementType\": \"labels.text.fill\",
                \"stylers\": [
                {
                \"color\": \"#757575\"
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
                \"elementType\": \"geometry\",
                \"stylers\": [
                {
                \"color\": \"#181818\"
                }
                ]
                },
                {
                \"featureType\": \"poi.park\",
                \"elementType\": \"labels.text.fill\",
                \"stylers\": [
                {
                \"color\": \"#616161\"
                }
                ]
                },
                {
                \"featureType\": \"poi.park\",
                \"elementType\": \"labels.text.stroke\",
                \"stylers\": [
                {
                \"color\": \"#1b1b1b\"
                }
                ]
                },
                {
                \"featureType\": \"road\",
                \"elementType\": \"geometry.fill\",
                \"stylers\": [
                {
                \"color\": \"#2c2c2c\"
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
                \"color\": \"#8a8a8a\"
                }
                ]
                },
                {
                \"featureType\": \"road.arterial\",
                \"elementType\": \"geometry\",
                \"stylers\": [
                {
                \"color\": \"#373737\"
                }
                ]
                },
                {
                \"featureType\": \"road.highway\",
                \"elementType\": \"geometry\",
                \"stylers\": [
                {
                \"color\": \"#3c3c3c\"
                }
                ]
                },
                {
                \"featureType\": \"road.highway.controlled_access\",
                \"elementType\": \"geometry\",
                \"stylers\": [
                {
                \"color\": \"#4e4e4e\"
                }
                ]
                },
                {
                \"featureType\": \"road.local\",
                \"elementType\": \"labels.text.fill\",
                \"stylers\": [
                {
                \"color\": \"#616161\"
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
                \"color\": \"#757575\"
                }
                ]
                },
                {
                \"featureType\": \"water\",
                \"elementType\": \"geometry\",
                \"stylers\": [
                {
                \"color\": \"#000000\"
                }
                ]
                },
                {
                \"featureType\": \"water\",
                \"elementType\": \"labels.text.fill\",
                \"stylers\": [
                {
                \"color\": \"#3d3d3d\"
                }
                ]
                }
                ]
                """
    }
    
}
