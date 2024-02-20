//
//  TimesView.swift
//  Planner
//
//  Created by Tom Work on 10/02/2024.
//

import SwiftUI
import SwiftData

struct TimesView: View {
    @Binding var plan: Plan?
   
    var body: some View {
        List {
            Section("Park visits") {
                ForEach(plan!.destination!.parks) { park in
                    
                    Text(park.name)
                        .badge(
                            Text("\(park.days?.count ?? 0)")
                                .fontWeight(.semibold)
                                )
                            
                    
                }
            }
        }.listStyle(.grouped)
            .navigationTitle("Info")
            .toolbar {
                MainToolbarView(plan: $plan)
            }
    }
}

#Preview {
   do {
       let config = ModelConfiguration(isStoredInMemoryOnly: true)
       let container = try ModelContainer(for: Plan.self, configurations: config)

       let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
       return TimesView(plan: .constant(example))
           .modelContainer(container)
   } catch {
       fatalError("Failed to create model container.")
   }
}
