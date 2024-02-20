//
//  DayDetailView.swift
//  Planner
//
//  Created by Tom Work on 11/02/2024.
//

import SwiftUI
import SwiftData

struct DayDetailView: View {
    @Binding var plan: Plan?
    @State var selectedDay: Day
    @State var calendarDay: Date = Date()
    @Binding var path: NavigationPath
    @State var showingAddSheet = false
    @State private var parkSelected = false
    @ViewBuilder
    var body: some View {
       
        
        List {
            Section("Parks") {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(plan!.destination!.parks) { park in
                            TapLabelView(day: $selectedDay, park: park)
                                .font(.system(size: 13))
                                .buttonStyle(.plain)
                        }
                    }.scrollTargetLayout()
                }           .scrollTargetBehavior(.viewAligned)
                    .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .listSectionSeparator(.hidden)
                            .safeAreaPadding(.horizontal, 20)
            }
            Section {
                DayStartListView()
                ForEach(Array(selectedDay.activities!.enumerated()), id: \.element.id) { index, activity in
                    ActivityListView(activity: activity, day: selectedDay)
                    
                    if index < selectedDay.activities!.count - 1 {
                        let nextActivity = selectedDay.activities![index + 1]
                        if activity.park?.name != nextActivity.park?.name {
                            TravelListView()
                        }
                    }
                }
                DayEndListView()
                
                Button("Add activities") {
                    showingAddSheet.toggle()
                }.disabled(selectedDay.parks!.isEmpty)
            } header: {
                Text("Activities")
            } footer: {
                if !parkSelected {
                    Text("Select a park to be able to add activities")
                }
            }.listRowBackground(Color.clear)
            .listRowSeparator(.hidden)
            
        }.listStyle(.grouped)
            .navigationTitle("\(selectedDay.date, style: .date)")
            .navigationBarTitleDisplayMode(.inline)
            .onChange(of: selectedDay.parks!.isEmpty) {
                if !selectedDay.parks!.isEmpty {
                    parkSelected = true
                } else {
                    parkSelected = false
                }
            }
            .onAppear {
                if !selectedDay.parks!.isEmpty {
                    parkSelected = true
                } else {
                    parkSelected = false
                }
            }
            .sheet(isPresented: $showingAddSheet) {
                AddActivityView(day: $selectedDay)
            }
    }
    
    
}

#Preview {
   do {
       let config = ModelConfiguration(isStoredInMemoryOnly: true)
       let container = try ModelContainer(for: Plan.self, configurations: config)
       let path = NavigationPath()
       let example = Day(date: Date.now, activities: nil)
       let examplePlan = Plan(name: "Test Plan", date: DateInterval(), details: "Plan details here")
       return NavigationStack {
           DayDetailView(plan: .constant(examplePlan), selectedDay: example, calendarDay: Date(), path: .constant(path))
       }
       .modelContainer(container)
   } catch {
       fatalError("Failed to create model container.")
   }
}
