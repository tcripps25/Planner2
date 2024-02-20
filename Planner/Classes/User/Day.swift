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
    var id: UUID
    var date: Date
    var parks: [Park]?
    var activities: [Activity]?
    
    init(date: Date, activities: [Activity]? = [], parks: [Park]? = [], id: UUID = UUID()) {
        self.id = id
        self.date = date
        self.parks = parks
        self.activities = activities
    }
}
