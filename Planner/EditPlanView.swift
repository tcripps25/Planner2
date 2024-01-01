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
    
    var body: some View {
        Form {
            TextField("Name", text: $plan.name)
            TextField("Details", text: $plan.details, axis: .vertical)
            DatePicker("Date", selection: $plan.date.start)
            DatePicker("Date", selection: $plan.date.end)
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)

        let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
        return EditPlanView(plan: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
