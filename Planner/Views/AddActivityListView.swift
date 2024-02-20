//
//  AddActivityListView.swift
//  Planner
//
//  Created by Tom Work on 17/02/2024.
//

import SwiftUI
import SwiftData

struct AddActivityListView: View {
    var activity: ActivityChildDestination
    var dest: ActivityParentDestination
    @Query var parks: [Park]
    var day: Day
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(activity.name)
                    .font(.system(size: 16))
                    .fontWeight(.semibold)
                Text(activity.entityType)
                    .font(.system(size: 13))
            }
            Spacer()
            Button {
                var newPark = Park()
                
                if let foundPark = parks.first(where: { $0.name == dest.name }) {
                    print("Found park with name '\(dest.name)': \(foundPark)")
                    newPark = foundPark
                } else {
                    print("Park with name '\(dest.name)' not found.")
                    
                }
                
                let name = activity.name
                let desc = ""
                let time = Date.now
                let type = activity.entityType
                let newActivity = Activity(name: name, desc: desc, time: time, park: newPark, type: type)
                day.activities?.append(newActivity)
                modelContext.insert(newActivity)
                dismiss()
            } label: {
                Label("Save activity to plan", systemImage: "square.and.arrow.down")
                    .labelStyle(.iconOnly)
            }
        }
    }
}

