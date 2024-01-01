//
//  PlannerApp.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import SwiftUI
import SwiftData

@main
struct PlannerApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: Plan.self)
    }
}
