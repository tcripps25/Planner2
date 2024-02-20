//
//  EditPlanView.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import SwiftUI
import SwiftData

struct EditPlanView: View {
    @Bindable var plan: Plan
    @Binding var selectedPlan: Plan?
    @State private var showingPlanChooser = false
    @Environment(\.dismiss) var dismiss
    
    let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
    var body: some View {
        NavigationStack {
            Form {
                VStack(alignment: .leading) {
                    Text("Name")
                        .bold()
                        .font(.footnote)
                    TextField("Name", text: $plan.name)
                }
                VStack(alignment: .leading) {
                    Text("Details")
                        .bold()
                        .font(.footnote)
                    TextField("Details", text: $plan.details, axis: .vertical)
                }
                
                DatePicker("Arrival Date", selection: $plan.date.start, displayedComponents: .date)
                DatePicker("Departure Date", selection: $plan.date.end, displayedComponents: .date)
            }
            .toolbar {
                Button {
                    showingPlanChooser.toggle()
                } label: {
                    Label("Choose Plan", systemImage: "list.bullet")
                }
            }
            .navigationTitle("Settings")
            .sheet(isPresented: $showingPlanChooser) {
                ChoosePlanView(currentPlan: $selectedPlan, onSheet: true)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)

        let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
        return EditPlanView(plan: example, selectedPlan: .constant(example))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
