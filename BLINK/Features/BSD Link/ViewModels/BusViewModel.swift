//
//  BusViewModel.swift
//  BLINK
//
//  Created by Jeremy Christopher on 21/06/23.
//

import Foundation
class ScheduleViewModel:ObservableObject{
    @Published var dateString = "11:00"
    @Published var dateString2 = " 15:00"
    
    func calculateTimeDifference() {
        // Create a DateFormatter object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        // Convert the strings to Date objects
        guard let date1 = dateFormatter.date(from: dateString),
              let date2 = dateFormatter.date(from: dateString2) else {
            print("Invalid date format")
            return
        }

        // Calculate the time difference in minutes
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: date1, to: date2)
        if let minutes = components.minute {
            print("Time difference in minutes:", minutes)
        } else {
            print("Failed to calculate time difference")
        }
    }
}







