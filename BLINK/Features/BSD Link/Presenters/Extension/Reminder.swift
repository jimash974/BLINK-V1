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
        
        content.body = "the (route) bus will arrive at \(notificationTimeString)"
        
        let triggerDateComponents = Calendar.current.dateComponents([.hour, .minute], from: notificationTime)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDateComponents, repeats: true)
        
        // Schedule the notification using the trigger and content
    }
    
    // Assuming you have a button or action that triggers the notification scheduling, action for reminder button on the recommendation page
    func handleTimeSelection() {
        let notification = Reminder()
        let timeBM = ["15:00", "08:00", "17:00", "19:00", "13:00"]
        let randomIndex = Int.random(in: 0..<timeBM.count)
        let chosenTime = timeBM[randomIndex]
        notification.scheduleRecurringNotification(time: chosenTime)
    }
    
    // ...
    
    func getNotificationTime(time: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        guard let chosenTime = dateFormatter.date(from: time) else {
            return ""
        }
        
        let notificationTime = Calendar.current.date(byAdding: .minute, value: -10, to: chosenTime)!
        
        let notificationTimeFormatter = DateFormatter()
        notificationTimeFormatter.dateFormat = "HH:mm"
        let notificationTimeString = notificationTimeFormatter.string(from: notificationTime)
        
        return notificationTimeString
    }
}
