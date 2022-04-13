//
//  LocationManager.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 7/4/22.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let locationManager = CLLocationManager()
    @Published var isNotDeterminated: Bool = true
    
    override init() {
        super.init()
        self.locationManager.delegate = self
    }
    
    func verifyAuth() {
        isNotDeterminated = locationManager.authorizationStatus == .notDetermined
    }
    
    func requestAuth(completionHandler: @escaping (() -> Void)) {
        self.locationManager.requestWhenInUseAuthorization()
        completionHandler()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        isNotDeterminated = manager.authorizationStatus == .notDetermined
    }
}
