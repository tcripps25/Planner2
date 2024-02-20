//
//  MainToolbarView.swift
//  Planner
//
//  Created by Tom Work on 10/02/2024.
//

import SwiftUI
import SwiftData

struct MainToolbarView: ToolbarContent {
    @Environment(\.modelContext) var modelContext
    @Binding var plan: Plan?
    @State private var showingSheet = false
    @State private var showingAddSheet = false
    @Query var plans: [Plan]
    
    var body: some ToolbarContent {
        
        ToolbarItem(placement: .primaryAction) {
            Menu {
                if plan != nil {
                
                Text(plan!.name)
                                   .font(.headline)
                Button("Plan Settings") {
                    showingSheet.toggle()
                }
                // only show the switch menu if there is more than one plan
                if plans.count > 1 {
                    Menu("Switch Plan") {
                        ForEach(plans, id: \.self) { currentPlan in
                            Button {
                                plan = currentPlan
                            } label: {
                                HStack {
                                    Text(currentPlan.name)
                                    if currentPlan.name == plan?.name {
                                        Image(systemName: "checkmark")
                                        }
                                    }
                                }
                            
                            }
                        }
                    }
                }
                Button {
                    showingAddSheet.toggle()
                } label: {
                    Label("New Plan", systemImage: "plus")
                }
            } label: {
                Label("Edit Plan", systemImage: "gearshape.fill")
            }.sheet(isPresented: $showingSheet) {
                EditPlanView(plan: plan!, selectedPlan: $plan)
            }.sheet(isPresented: $showingAddSheet) {
                AddPlanView(selectedPlan: $plan)
            }
                
                
        }
    }
    
    
}
