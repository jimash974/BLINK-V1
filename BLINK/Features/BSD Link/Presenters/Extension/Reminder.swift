//
//  Reminder.swift
//  BLINK
//
//  Created by Jeremy Christopher on 21/06/23.
//


//
//  LocalNotification.swift
//  Blink
//
//  Created by Rachmaniar Larasati on 27/06/23.
//

import Foundation
import UserNotifications

class Reminder {
    func askPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Access granted!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func scheduleRecurringNotification(time: String) {
        let content = UNMutableNotificationContent()
        content.title = "Blink"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        guard let chosenTime = dateFormatter.date(from: time) else {
            print("Invalid time format")
            return
        }
        
        // Calculate the notification trigger time (10 minutes earlier than chosenTime)
        let notificationTime = Calendar.current.date(byAdding: .minute, value: -10, to: chosenTime)!
        
        // Format the notification time to display in the notification
        let notificationTimeFormatter = DateFormatter()
        notificationTimeFormatter.dateFormat = "HH:mm"
        let notificationTimeString = notificationTimeFormatter.string(from: notificationTime)
        
        content.body = "The (route) bus will arrive at \(notificationTimeString)" //change the (route) with route name
        
        let triggerDateComponents = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: true)
        
        // Create the request
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Failed to schedule notification: \(error)")
            } else {
                print("Notification scheduled successfully!")
            }
        }
    }
}

// Assuming you have a button or action that triggers the notification scheduling
func handleNotificationScheduling() {
    let notification = Reminder()
    notification.askPermission() // Request permission to display notifications
//    notification.scheduleRecurringNotification(time: "11:39") ( Replace "10:00" with the card chosen time)
}
