//
//  NotificationManager.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 7/4/22.
//

import SwiftUI

class NotificationManager: ObservableObject {
    let center = UNUserNotificationCenter.current()
    @Published var isNotificationAvailable: Bool = false
    
    
    
    func requestNotificationsAuth(completionHandler: @escaping (() -> Void)) {
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if let error = error {
                // Handle the error here.
                print("Error: \(error.localizedDescription)")
            }
            DispatchQueue.main.async {
                self.isNotificationAvailable = granted
                completionHandler()
            }
        }
    }
    
    func verifyNotificationPermission() {
        center.getNotificationSettings { settings in
            DispatchQueue.main.async {
                self.isNotificationAvailable = (settings.authorizationStatus != .notDetermined && settings.authorizationStatus != .denied)
            }
        }
    }
}
