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
    
    @Binding var currentPlan: Plan?
    @State var onSheet: Bool?
    
    var body: some View {
       
        
        NavigationStack {
            List {
                ForEach(plans) { plan in
                        Button (action: {
                            currentPlan = plan
                            
                            if currentPlan != nil {
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
                MainToolbarView(plan: $currentPlan)
            }
        }
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
        return ChoosePlanView(currentPlan: .constant(example))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
