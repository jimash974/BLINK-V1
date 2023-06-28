//
//  BLINKApp.swift
//  BLINK
//
//  Created by Jeremy Christopher on 21/06/23.
//

import SwiftUI

@main
struct BLINKApp: App {

    @StateObject var appData = ApplicationData()
    @StateObject var sheetManager = SheetManager()
    @StateObject var appManager : AppManager = AppManager()

    var body: some Scene {
        WindowGroup {
            RecommendationView()
                .environmentObject(appData)
                .environmentObject(appManager)
                .environment(\.managedObjectContext,appData.container.viewContext)
                .environmentObject(sheetManager)
//            ContentView()
//               .environment(\.managedObjectContext, appData.container.viewContext)
        }
    }
}
