//
//  CarouselOptions.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 7/4/22.
//

import SwiftUI

struct CarouselOptions: Identifiable, Hashable{
    var id = UUID().uuidString
    var tag: Int
    var mainImageName: String
    var title: String
    var description: String
    var mainButtonText: String
}

var carouselOptions = [

    CarouselOptions(
        tag: 0,
        mainImageName: R.Base.icCameraPermissions.name,
        title: L10n.cameraAccessTitle,
        description: L10n.cameraAccessDescription,
        mainButtonText: L10n.allowButtonText
    ),
    
    CarouselOptions(
        tag: 1,
        mainImageName: R.Base.icNotificationsPermissions.name,
        title: L10n.enablePushNotificationsTitle,
        description: L10n.enablePushNotificationsDescription,
        mainButtonText: L10n.enableButtonText
    ),
    
    CarouselOptions(
        tag: 2,
        mainImageName: R.Base.icLocationPermissions.name,
        title: L10n.enableLocationTitle,
        description: L10n.enableLocationDescription,
        mainButtonText: L10n.enableButtonText
    )
    
]
