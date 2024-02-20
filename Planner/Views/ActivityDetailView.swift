//
//  ActivityDetailView.swift
//  Planner
//
//  Created by Tom Work on 20/02/2024.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    var day: Day
    var body: some View {
        List {
            
                Text(activity.name)
                Text(activity.time.formatted(date: .complete, time: .complete))
                Text(activity.park?.name ?? "No Park")
                Text(activity.time.formatted(date: .omitted, time: .complete))
                // each day that this plan goes to the park that this activity belongs to, so the user can switch!
                ForEach((activity.park?.days)!) { activityDay in
                    if activityDay != day {
                        Text(activityDay.date.formatted(date: .complete, time: .omitted))
                    }
                }
               
            
        }
    }
}

/* #Preview {
    let exampleAct = Activity(name: "Pirates of the Carribbean", desc: "Notes", time: Date.now, park: nil, type: "ATTRACTION")
    ActivityDetailView(activity: exampleAct)
} */
