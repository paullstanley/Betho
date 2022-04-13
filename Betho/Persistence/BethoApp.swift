//
//  BethoApp.swift
//  Betho
//
//  Created by Paull Stanley on 4/11/22.
//

import SwiftUI

@main
struct BethoApp: App {
    let shared = CoreDataManager.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, shared.container.viewContext)
        }
    }
}
