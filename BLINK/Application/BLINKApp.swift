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


    var body: some Scene {
        WindowGroup {
            HomePage()
                .environmentObject(appData)
                .environment(\.managedObjectContext,appData.container.viewContext)
                .environmentObject(sheetManager)
//            ContentView()
//               .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
