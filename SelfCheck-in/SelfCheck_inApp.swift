//
//  SelfCheck_inApp.swift
//  SelfCheck-in
//
//  Created by نوف بخيت الغامدي on 27/10/1444 AH.
//
//First Push
import SwiftUI

import FirebaseCore

@main
struct SelfCheck_inApp: App {
 
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
    
  }
}
