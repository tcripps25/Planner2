//
//  DestinationView.swift
//  Planner
//
//  Created by Tom Work on 17/02/2024.
//

import SwiftUI
import SwiftData

struct DestinationView: View {
    var destination: Destination
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .center) {
               
                    Text(destination.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.system(size: 24))
                    .foregroundStyle(Color.black.opacity(0.8))
            }
        }.listRowBackground(Color.orange)
            .frame(height: 100)
            
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
