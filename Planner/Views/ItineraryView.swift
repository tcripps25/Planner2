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
            List {
                DestinationView(destination: plan!.destination ?? Destination(id: "0000", name: "Test Destination", slug: "waltdisneyworldresort"))
               
                Section("Overview") {
                    ForEach(plan!.days.sorted(by: { $0.date < $1.date }), id: \.id) { day in
                        NavigationLink(value: day) {
                            VStack(alignment: .leading) {
                                Text("\(formatDate(date: day.date))")
                                    .font(.system(size: 16))
                                    .fontWeight(.semibold)
                                VStack(alignment: .leading) {
                                    ForEach(day.parks!) { park in
                                        Text(park.name)
                                    }.font(.system(size: 13))
                                }.padding(.vertical)
                                if day.activities?.isEmpty == true {
                                    Text("No activities today")
                                        .font(.system(size: 13))
                                } else {
                                    
                                    Text("\(day.activities!.count) activities today")
                                        .font(.system(size: 13))
                                }
                            }
                        }
            }
                        }
            }.navigationDestination(for: Day.self) { day in
                DayDetailView(plan: $plan, selectedDay: day, path: $path)
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
