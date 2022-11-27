//
//  ClockWorkNoAngstApp.swift
//  ClockWorkNoAngst
//
//  Created by alexander aspman on 2022-11-27.
//

import SwiftUI

@main
struct ClockWorkNoAngstApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
