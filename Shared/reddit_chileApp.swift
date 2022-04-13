//
//  reddit_chileApp.swift
//  Shared
//
//  Created by Byron Chavarría on 13/4/22.
//

import SwiftUI

@main
struct reddit_chileApp: App {
    let cameraManager = CameraManager()
    let notificationManager = NotificationManager()
    let locationManager = LocationManager()
    @State var isAuth: Bool = true
    var body: some Scene {
        WindowGroup {
            Group {
                if isAuth {
                    PostsListView()
                } else {
                    PermissionsTabView()
                }
            }.onAppear {
                notificationManager.verifyNotificationPermission()
                cameraManager.verifyCameraPermisions()
                locationManager.verifyAuth()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.getAuth()
                }
            }
        }
    }
    
    func getAuth() {
        isAuth = cameraManager.permissionGranted && notificationManager.isNotificationAvailable && !locationManager.isNotDeterminated
    }
}
