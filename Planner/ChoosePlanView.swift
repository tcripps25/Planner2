//
//  ChoosePlanView.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import SwiftUI
import SwiftData

struct ChoosePlanView: View {
    @Query var plans: [Plan]
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @Binding var selectedPlan: Plan?
    @State var onSheet: Bool?
    
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(plans) { plan in
                        Button (action: {
                            selectedPlan = plan
                            if selectedPlan != nil {
                                if onSheet ?? false {
                                    dismiss()
                                }
                            }
                        }, label: {
                            VStack(alignment: .leading) {
                                Text(plan.name)
                                    .font(.headline)
                                
                                Text(plan.date.start.formatted(date: .long, time: .shortened))
                            }
                        })
                    
                }.onDelete(perform: deletePlans)
            }.toolbar {
                Button("Add Plan", systemImage: "plus", action: addPlan)
                Button("Add Samples", action: addSamples)
            }
        }
    }
    func addSamples() {
        let rome = Plan(name: "Rome")
        let florence = Plan(name: "Florence")
        let naples = Plan(name: "Naples")
        
        modelContext.insert(rome)
        modelContext.insert(florence)
        modelContext.insert(naples)
    }
    
    func addPlan() {
        let plan = Plan()
        plan.selectedTab = "settings"
        modelContext.insert(plan)
        selectedPlan = plan
        
    }
    
    func deletePlans(_ indexSet: IndexSet) {
        for index in indexSet {
            let plan = plans[index]
            modelContext.delete(plan)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)

        @State var example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
        return ChoosePlanView(selectedPlan: .constant(example))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
