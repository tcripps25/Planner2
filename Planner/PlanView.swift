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
    @State private var showingPlanChooser = false
    
    
    var body: some View {
        
        
        
        TabView() {
            NavigationStack {
                Text(plan?.name ?? "No Plan Found")
                    .toolbar {
                    Button("Choose Plan") {
                        showingPlanChooser.toggle()
                    }
                }
            }.tag("plan")
                .tabItem {
                    Label("Plan", systemImage: "list.star")
                }
            
            Text("Wishes")
                .tag("wishes")
                .tabItem {
                    Label("Wishes", systemImage: "star")
                }
            EditPlanView(plan: plan!)
                .tag("settings")
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }.sheet(isPresented: $showingPlanChooser) {
            ChoosePlanView(selectedPlan: $plan, onSheet: true)
        }
    }
}

/* #Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)

        @State var example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
        return PlanView(plan: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
} */
