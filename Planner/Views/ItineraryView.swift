//
//  ItineraryView.swift
//  Planner
//
//  Created by Tom Work on 02/01/2024.
//

import SwiftUI
import SwiftData

struct ItineraryView: View {
    @Binding var plan: Plan?
    @Query var plans: [Plan]
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            List(plan!.days) { day in
                Section("\(day.date, style: .date)") {
                    NavigationLink(value: day) {
                        if day.activities?.isEmpty == true {
                            Text("No activities today")
                        }
                    }
                }
                
            }.navigationDestination(for: Day.self) { day in
                DayDetailView(plan: $plan, selectedDay: day, path: $path, locations: [])
            }
            .listStyle(.grouped)
            
            
                .navigationTitle("Itinerary")
                .toolbar {
                    MainToolbarView(plan: $plan)
                }
        }
    }
}

#Preview {
   do {
       let config = ModelConfiguration(isStoredInMemoryOnly: true)
       let container = try ModelContainer(for: Plan.self, configurations: config)

       let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
       return ItineraryView(plan: .constant(example))
           .modelContainer(container)
   } catch {
       fatalError("Failed to create model container.")
   }
}
