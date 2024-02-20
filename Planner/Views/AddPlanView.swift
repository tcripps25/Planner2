//
//  AddPlanView.swift
//  Planner
//
//  Created by Tom Work on 10/02/2024.
//

import SwiftUI
import SwiftData

struct AddPlanView: View {
    @Environment(\.dismiss) var dismiss
    @State var newPlan = Plan()
    @Environment(\.modelContext) var modelContext
    @Binding var selectedPlan: Plan?
    @State private var destinations = [TempDestination]()
    @State private var destinationId = ""
    
    var body: some View {
    
        NavigationStack {
           
            Form {
                
                VStack(alignment: .leading) {
                    Text("Name")
                        .bold()
                        .font(.footnote)
                    TextField("Name", text: $newPlan.name)
                }
                VStack(alignment: .leading) {
                    Text("Details")
                        .bold()
                        .font(.footnote)
                    TextField("Details", text: $newPlan.details, axis: .vertical)
                }
                Section {
                    Picker("Destination", selection: $destinationId) {
                        ForEach(destinations, id: \.id) { dest in
                            Text(dest.name)
                                .tag(dest.id)
                        }
                    }.task {
                        destinations = await LoadData() ?? [TempDestination(id: "0000", name: "No Destinations found", slug: "0000", parks: [])]
                        destinationId = destinations.first?.id ?? "No Id"
                        print(destinations.count)
                    }
                    }
                DatePicker("Arrival Date", selection: $newPlan.date.start, displayedComponents: .date)
                DatePicker("Departure Date", selection: $newPlan.date.end, displayedComponents: .date)
                Section {
                    Button("Save Plan") {
                        addPlan(modelContext: modelContext, newPlan: newPlan, destinations: destinations, destinationId: destinationId)
                        selectedPlan = newPlan
                        dismiss()
                    }
                }
            }
            .navigationTitle("New Plan")
           
        }
        
    }

    
    
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Plan.self, configurations: config)
        let exdest = Destination(id: "000", name: "Test Destination", slug: "test-dest")
        let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here", destination: exdest)
        return AddPlanView(selectedPlan: .constant(example))
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
