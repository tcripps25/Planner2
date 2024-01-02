//
//  WishesView.swift
//  Planner
//
//  Created by Tom Work on 02/01/2024.
//

import SwiftUI
import SwiftData

struct WishesView: View {
    @Binding var plan: Plan?
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationTitle("Wishes")
    }
}

#Preview {
   do {
       let config = ModelConfiguration(isStoredInMemoryOnly: true)
       let container = try ModelContainer(for: Plan.self, configurations: config)

       let example = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
       return WishesView(plan: .constant(example))
           .modelContainer(container)
   } catch {
       fatalError("Failed to create model container.")
   }
}
