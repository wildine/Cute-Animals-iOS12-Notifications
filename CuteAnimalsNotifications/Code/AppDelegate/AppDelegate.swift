//
//  AppDelegate.swift
//  CuteAnimalsNotifications
//
//  Copyright © 2018 Wiwi. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let center = UNUserNotificationCenter.current()
    center.delegate = self
    let options: UNAuthorizationOptions = [.alert, .sound]
    center.requestAuthorization(options: options) {
      (granted, error) in
      if !granted {
        print("Oups! user did not grant permission to send notifications.")
      }
    }
    center.getNotificationSettings { (settings) in
      if settings.authorizationStatus != .authorized {
        // Notifications not allowed
      }
    }
    
    return true
  }
}

// MARK: UNUserNotificationCenterDelegate
extension AppDelegate : UNUserNotificationCenterDelegate {
  func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
    
    completionHandler([.alert, .sound])
  }
}

