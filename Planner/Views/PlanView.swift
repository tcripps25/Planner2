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
                ItineraryView(plan: $plan)
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
                TimesView(plan: $plan)
            }
                .tag("Info")
                .tabItem {
                    Label("Info", systemImage: "chart.bar.fill")
                }
        }
    }
}

 #Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)
        let exdest = (Destination(id: "0000", name: "Test Destination", slug: "test-dest"))
        let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here", destination: exdest)
        return PlanView(plan: .constant(example))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
