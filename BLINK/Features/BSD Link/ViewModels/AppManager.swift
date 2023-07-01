//
//  AppManager.swift
//  BLINK
//
//  Created by Felix Natanael on 26/06/23.
//

import Foundation
import CoreData
import SwiftUI


class AppManager : ObservableObject {
    @Environment(\.managedObjectContext) var dbContext
    @Environment (\.dismiss) var dismiss
    @Published var pilihJam = Date()
    @FetchRequest(sortDescriptors: [], predicate: nil, animation: .default) private var listofBookmark: FetchedResults <Item>
    
    var halteAwal = ""
    var halteAkhir = ""
    var jam = ""
    
    
    func formattedTime(date: Date) -> String {
            let timeFormatter = DateFormatter()
            timeFormatter.timeStyle = .short
            return timeFormatter.string(from: date)
        }
}







