//
//  ContentView.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    @State var plan: Plan?
    
    
    var body: some View {
        if plan != nil {
            PlanView(plan: $plan)
            } else {
                ChoosePlanView(currentPlan: $plan)
            }
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)

        let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
        return ContentView(plan: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
