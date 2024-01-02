//
//  Plan.swift
//  Planner
//
//  Created by Tom Work on 01/01/2024.
//

import Foundation
import SwiftData

@Model
class Plan {
    var name: String
    var date: DateInterval
    var details: String
    var selectedTab: String
    
    init(name: String = "", date: DateInterval = DateInterval(), details: String = "", selectedTab: String = "Itinerary") {
        self.name = name
        self.date = date
        self.details = details
        self.selectedTab = selectedTab
    }
}
