//
//  PermissionsTabViewModel.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 9/4/22.
//

import Foundation
import Combine
import SwiftUI

class PermissionsTabViewModel: ObservableObject {
    
    var cameraManager = CameraManager()
    var locationManager = LocationManager()
    var notificationManager = NotificationManager()
    
    @Published var hasCameraPermissions: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    @Published var hasLocationPermissions: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    @Published var hasNotificationsPermissions: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
    let didChange = PassthroughSubject<PermissionsTabViewModel, Never>()
    
    init() {
        getCameraPermissions()
        getLocationPermissions()
        getNotificationsPermissions()
    }
    
    func getCameraPermissions() {
        hasCameraPermissions = cameraManager.permissionGranted
    }
    
    func requestCameraPermissions() {
        cameraManager.requestPermission {
            self.getCameraPermissions()
        }
    }
    
    func getLocationPermissions() {
        hasLocationPermissions = !locationManager.isNotDeterminated
    }
    
    func requestLocationPermissions() {
        locationManager.requestAuth {
            self.getLocationPermissions()
        }
    }
    
    func getNotificationsPermissions() {
        hasNotificationsPermissions = notificationManager.isNotificationAvailable
    }
    
    func requestNotificationsPermissions() {
        notificationManager.requestNotificationsAuth() {
            DispatchQueue.main.async {
                self.getNotificationsPermissions()
            }
        }
    }
}
