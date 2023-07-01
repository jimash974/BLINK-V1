//
//  BusViewModel.swift
//  BLINK
//
//  Created by Jeremy Christopher on 21/06/23.
//

import Foundation
class ScheduleViewModel:ObservableObject{
//    @Published var dateString = "11:00"
//    @Published var dateString2 = " 15:00"
    
    let arrSchedule = ["10:00", "11:00", "12:00", "13:00", "14:00", "15:00"]
    let choosenTime = "12:30"
    var listTime = [""]
    
    func listEstimatedTime() {
        for schedule in arrSchedule {
            if let difference = calculateTimeDifference(dateString: choosenTime, dateString2: schedule) {
//                print(difference)
                
                // Perform further actions based on the unwrapped difference value
                if difference >= -30 && difference < 60 {
                    listTime.append(schedule)
                }else{
                    print("Exclude")
                }
            } else {
                print("Unable to calculate time difference")
            }
        }
    }
    
    func calculateTimeDifference(dateString:String, dateString2:String) -> Int? {
        // Create a DateFormatter object
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"

        // Convert the strings to Date objects
        guard let date1 = dateFormatter.date(from: dateString),
              let date2 = dateFormatter.date(from: dateString2) else {
            print("Invalid date format")
            return nil
        }

        // Calculate the time difference in minutes
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: date1, to: date2)
        if let minutes = components.minute {
            print("Time difference in minutes:", minutes)
            return minutes
        } else {
            print("Failed to calculate time difference")
            return nil
        }
    }
}







