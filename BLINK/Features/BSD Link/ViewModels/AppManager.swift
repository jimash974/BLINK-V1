
//
//  AppManager.swift
//  BLINK
//
//  Created by Felix Natanael on 26/06/23.
//

import Foundation

class AppManager : ObservableObject {
    @Published var pilihJam = Date()
    
    func formattedTime(date: Date) -> String {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: date)
        }
}

