//
//  ContentView.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State var selectedPlan: Plan?
    
    
    var body: some View {
        
        if selectedPlan != nil {
            PlanView(plan: $selectedPlan)
        } else {
            ChoosePlanView(selectedPlan: $selectedPlan)
        }
    }
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)

        let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
        return ContentView(selectedPlan: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
