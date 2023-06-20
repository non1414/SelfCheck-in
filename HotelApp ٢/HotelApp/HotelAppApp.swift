//
//  HotelAppApp.swift
//  HotelApp
//
//  Created by نوف بخيت الغامدي on 06/11/1444 AH.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct HotelAppApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var firebaseManager = FirebaseManager()
    var body: some Scene {
        WindowGroup {
            Group{
                if firebaseManager.auth.currentUser == nil {
                    Splash()
                } else {
                    MainPage()
                }
            }
                .environmentObject(FirebaseManager())
        }
    }
}
