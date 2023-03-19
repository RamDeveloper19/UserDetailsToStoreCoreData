//
//  GoogleMapsVC.swift
//  InterViewTask
//
//  Created by Ram kumar on 18/03/23.
//

import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapsVC: UIViewController, GMSMapViewDelegate {

    public let googleMapView = GoogleMapsView()
    private var locationManager = CLLocationManager()
    private let marker = GMSMarker()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.locationManagerAct()
    }
    
    func setupViews() {
        googleMapView.setupViews(Base: self.view)
        googleMapView.mapview.delegate = self
    }
    
    func locationManagerAct() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
    }
    
}

extension GoogleMapsVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        guard status == .authorizedWhenInUse else {
            return
        }
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLoc = locations.first else {
            return
        }

        let camera = GMSCameraPosition.camera(withLatitude: currentLoc.coordinate.latitude, longitude: currentLoc.coordinate.longitude, zoom: 18)
        self.googleMapView.mapview.camera = camera
        marker.icon = UIImage(named: "Travelcons")
        marker.position = CLLocationCoordinate2D(latitude: currentLoc.coordinate.latitude, longitude: currentLoc.coordinate.longitude)
        marker.isFlat = true
        marker.map = googleMapView.mapview
        locationManager.stopUpdatingLocation()
    }
}
