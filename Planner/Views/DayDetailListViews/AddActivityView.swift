//
//  AddActivityView.swift
//  Planner
//
//  Created by Tom Work on 14/02/2024.
//

import SwiftUI
import SwiftData

struct AddActivityView: View {
    @Binding var day: Day
    @State private var activities = [ActivityParentDestination]()

    
    var body: some View {
        NavigationStack {
            List {
                ForEach(activities, id: \.id) { dest in
                    Section("\(dest.name)") {
                        ForEach(dest.children, id: \.id) { activity in
                            AddActivityListView(activity: activity, dest: dest, day: day)
                        }
                    }
                }
                
            }.listStyle(.grouped)
                .task {
                    for park in day.parks! {
                        var newactivities = [ActivityParentDestination]()
                        newactivities = await LoadActivityData(locationId: park.id) ?? []
                        
                        activities.append(contentsOf: newactivities)
                    }
                }.navigationTitle("Add an activity")
                .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

/*#Preview {
    AddActivityView()
}*/
