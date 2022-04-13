//
//  CameraManager.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 7/4/22.
//

import Foundation
import AVFoundation

class CameraManager : ObservableObject {
    @Published var permissionGranted = false
    
    func verifyCameraPermisions() {
        self.permissionGranted = AVCaptureDevice.authorizationStatus(for: .video) ==  .authorized
    }
    
    func requestPermission(completionHandler: @escaping () -> Void) {
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
            DispatchQueue.main.async {
                self.permissionGranted = granted
                completionHandler()
            }
        })
    }
}
