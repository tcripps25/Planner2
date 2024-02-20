//
//  Park.swift
//  Planner
//
//  Created by Tom Work on 13/02/2024.
//

import Foundation
import SwiftData

@Model
class Park: Identifiable, Hashable {
    
    var id: String
    var name: String
    var activities: [Activity]?
    @Relationship(inverse: \Day.parks) var days: [Day]?
    
    init(id: String = "", name: String = "", activities: [Activity]? = [], days: [Day]? = []) {
        self.id = id
        self.name = name
        self.activities = activities
        self.days = days
    }

}
