//
//  PlanView.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import SwiftUI
import SwiftData

struct PlanView: View {
    @Binding var plan: Plan?
    
    
    
    var body: some View {
        
        
        
        TabView() {
            NavigationStack {
                ItineraryView(plan: $plan)
            }
                .tag("Itinerary")
                    .tabItem {
                        Label("Itinerary", systemImage: "list.star")
                    }
            NavigationStack {
                WishesView(plan: $plan)
            }
                .tag("Wishes")
                .tabItem {
                    Label("Wishes", systemImage: "star")
                }
            NavigationStack {
                EditPlanView(plan: plan!, selectedPlan: $plan)
            }
                .tag("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

 #Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)

        let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
        return PlanView(plan: .constant(example))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
