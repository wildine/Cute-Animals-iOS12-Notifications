//
//  ViewController.swift
//  CuteAnimalsNotifications
//
//  Copyright © 2018 Wiwi. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
  
  // MARK: Outlets
  
  @IBOutlet weak var ibSendNotificationsButton: UIButton!
  
  // MARK: Properties
  
  
  // MARK: Overrides

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
  private func sendNotifications() {
    for i in 1...5 {
      let content = UNMutableNotificationContent()
      content.categoryIdentifier = "CuteAnimalsNotification"
      content.title = "Cutie n° \(i)"
      content.body = "\(Date())"
      if i == 2 {
        content.threadIdentifier = "cute-animals"
      }
      else {
        content.threadIdentifier = "cute-animals-groupnotif"
        content.summaryArgumentCount = 1
        content.summaryArgument = "Cute Animals Factory"
      }
      let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(10*i), repeats: false)
      let request = UNNotificationRequest(identifier: "NotificationID\(i)", content: content, trigger: trigger)
      let center = UNUserNotificationCenter.current()
      center.add(request) { (error) in
        print(error?.localizedDescription ?? "")
      }
    }
  }
  
  // MARK: Actions
  
  @IBAction func sendNotificationTouchUpInside(_ sender: UIButton) {
    self.sendNotifications()
  }
}
