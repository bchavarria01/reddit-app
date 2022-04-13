//
//  PermissionsTabView.swift
//  redit-chile (iOS)
//
//  Created by Byron Chavarría on 9/4/22.
//

import SwiftUI

struct PermissionsTabView: View {
    @State var selectedView: Int = 0
    @State var isSearching = false
    @StateObject var cameraManager = CameraManager()
    @StateObject var locationManager = LocationManager()
    @StateObject var notificationManager = NotificationManager()
    @State var finalOptions: [CarouselOptions] = []
    @State private var selection: String? = nil
    @State private var isAllAuth: Bool = false
    
    init() {
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        NavigationView {
            TabView(selection: $selectedView) {
                ForEach(finalOptions) { option in
                    CarouselPermissionsView(
                        mainImageName: option.mainImageName,
                        title: option.title,
                        description: option.description,
                        mainButtonText: option.mainButtonText,
                        mainButtonAction: {
                            if self.isAllAuth {
                                selection = "A"
                            } else {
                                if option.tag == 0 {
                                    if !cameraManager.permissionGranted {
                                        cameraManager.requestPermission() {
                                            if cameraManager.permissionGranted {
                                                validateFinalOptionArray()
                                                selectedView = (selectedView + 1)
                                            }
                                        }
                                    } else {
                                        validateFinalOptionArray()
                                        selectedView = (selectedView + 1)
                                    }
                                } else if option.tag == 1 {
                                    if !notificationManager.isNotificationAvailable {
                                        notificationManager.requestNotificationsAuth() {
                                            if notificationManager.isNotificationAvailable {
                                                validateFinalOptionArray()
                                                selectedView = (selectedView + 1)
                                            }
                                        }
                                    } else {
                                        validateFinalOptionArray()
                                        selectedView = (selectedView + 1)
                                    }
                                } else if option.tag == 2 {
                                    if locationManager.isNotDeterminated {
                                        locationManager.requestAuth() {
                                            if !locationManager.isNotDeterminated {
                                                selection = "A"
                                            }
                                        }
                                    } else {
                                        selection = "A"
                                    }
                                }
                            }
                            
                        },
                        cancelButtonAction: {
                            if option.tag == 2 {
                                selection = "B"
                            } else {
                                validateFinalOptionArray()
                                selectedView = (selectedView + 1)
                            }
                        },
                        selection: $selection).tag(option.tag)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .onAppear {
                cameraManager.verifyCameraPermisions()
                locationManager.verifyAuth()
                notificationManager.verifyNotificationPermission()
                validateFinalOptionArray()
            }
            .onChange(of: isAllAuth) { newValue in
                if newValue {
                    selection = "A"
                }
            }
            .onChange(of: cameraManager.permissionGranted) { newValue in
                isAllGranted()
            }
            .onChange(of: notificationManager.isNotificationAvailable) { newValue in
                notificationManager.verifyNotificationPermission()
                isAllGranted()
            }
            .onChange(of: locationManager.isNotDeterminated) { newValue in
                isAllGranted()
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
    
    func isAllGranted() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let isAllGranted = cameraManager.permissionGranted && notificationManager.isNotificationAvailable && !locationManager.isNotDeterminated
            self.isAllAuth = isAllGranted
        }
    }
    
    func validateFinalOptionArray() {
        finalOptions = carouselOptions
        if cameraManager.permissionGranted {
            finalOptions = finalOptions.filter({ option in
                option.title != L10n.cameraAccessTitle
            })
        }
        if notificationManager.isNotificationAvailable {
            finalOptions = finalOptions.filter({ option in
                option.title != L10n.enablePushNotificationsTitle
            })
        }
        if !locationManager.isNotDeterminated {
            finalOptions = finalOptions.filter({ option in
                option.title != L10n.enableLocationTitle
            })
        }
    }
}

struct PermissionsTabView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsTabView()
    }
}
