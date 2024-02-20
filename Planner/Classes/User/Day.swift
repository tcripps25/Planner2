//
//  Day.swift
//  Planner
//
//  Created by Tom Work on 09/02/2024.
//

import Foundation
import SwiftData

@Model
class Day: Identifiable, Equatable {
    var date: Date
    var locations: [UserLocation]?
    var activities: [UserActivity]?
    
    init(date: Date, locations: [UserLocation]? = [], activities: [UserActivity]? = []) {
        self.date = date
        self.locations = locations
        self.activities = activities
    }
}
