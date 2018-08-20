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
  
  @IBOutlet weak var ibSendCutiesButton: UIButton!
  
  // MARK: Properties
  
  let cuteAnimalsArray = ["🐭","🐹","🐰","🐶","🐺","🦊","🐵","🐸","🐯","🦁","🦓","🦒","🐴","🐮","🐷","🐻","🐼","🐲","🦄","🐱","😸","😹","😺","😻","😼","😽","🐅","🐆","🐘","🦏","🐂","🐃","🐄","🐎","🦌","🐐","🐏","🐑","🐖","🐗","🐪","🐫","🦍","🐉","🦖","🦕","🐈","🐀","🐁","🐇","🐒","🐕","🐩","🐨","🐿","🦔","🦇","🐍","🦅","🦉","🦆","🐓","🐔","🦃","🕊","🐣","🐤","🐥","🐦","🐧","🐳","🐬","🦈","🐟","🐠","🐡","🐙","🦑","🦐","🦀","🐚","🐌","🐢","🦎","🐊","🙈","🙉","🙊","🎠","🐽","🦋","🐝","🐞","🐜","🐛","🕷","🦂","🦗"]

  let cuteAnimalsSentencesArray = ["Sometimes I wish I was an octopus, so I could slap eight people at once.",
                                   "Seeing a spider in my room isn't scary. It's scary when it disappears.",
                                   "You can trust your dog to guard your house but never trust your dog to guard your sandwich.",
                                   "I dream of a better tomorrow, where chickens can cross the road and not be questioned about their motives.",
                                   "Sharks are not so bad... If a stranger came into my house wearing only a bathing suit, I'd probably get angry too.",
                                   "In spring birds return from their tropical vacation. Six months later they regret their decision and go back.",
                                   "Two fleas are coming out of a bar when one asks the other 'Do we take a dog or do we walk home?'",
                                   "A zooology teacher asks the class 'What is the one animal in the jungle that a lion is afraid of?' The class answers: a lioness.",
                                   "In spring birds return from their tropical vacation. Six months later they regret their decision and go back.",
                                   "Don't worry, the spider is smaller than you. 'Yeah. So is a grenade.'"]
  
  
  // MARK: Overrides

  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.configureView()
  }
  
  private func configureView() {
    self.ibSendCutiesButton.setTitle("Send me cuties notifications please !!!", for: .normal)
    self.ibSendCutiesButton.layer.cornerRadius = 10
    self.ibSendCutiesButton.backgroundColor = .blue
    self.ibSendCutiesButton.setTitleColor(.white, for: .normal)
  }
  
  private func sendCutiesNotifications() {
    for i in 1...5 {
      if let cutie = self.cuteAnimalsArray.randomElement(), let cutieSentence = self.cuteAnimalsSentencesArray.randomElement() {
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "CuteAnimalsNotification"
        content.title = "Cutie n° \(i): "
        content.body = "\(cutie) \(cutieSentence)"
        if i == 2 {
          content.threadIdentifier = "cute-animals"
        }
        else {
          content.threadIdentifier = "cute-animals-groupnotif"
          content.summaryArgumentCount = 1
          content.summaryArgument = "Cute Animals Notifications"
        }
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(10*i), repeats: false)
        let request = UNNotificationRequest(identifier: "NotificationID\(i)", content: content, trigger: trigger)
        let center = UNUserNotificationCenter.current()
        center.add(request) { (error) in
          print(error?.localizedDescription ?? "")
        }
      }
    }
  }
  
  // MARK: Actions
  
  @IBAction func sendCutiesTouchUpInside(_ sender: UIButton) {
    self.sendCutiesNotifications()
  }
}
