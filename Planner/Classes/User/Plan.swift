//
//  Plan.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import Foundation
import SwiftData

@Model
class Plan: Identifiable, Equatable {
    var id: UUID
    var name: String
    var date: DateInterval
    var details: String
    var selectedTab: String
    var days: [Day]
    

    
    init(id: UUID = UUID(), name: String = "", date: DateInterval = DateInterval(), details: String = "", selectedTab: String = "Itinerary", days: [Day] = []) {
        self.id = id
        self.name = name
        self.date = date
        self.details = details
        self.selectedTab = selectedTab
        self.days = days
    }
}
