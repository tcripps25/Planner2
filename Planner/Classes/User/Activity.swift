//
//  Activity.swift
//  Planner
//
//  Created by Tom Work on 09/02/2024.
//

import Foundation
import SwiftData

@Model
class Activity: Identifiable, Equatable {
    var name: String
    var desc: String
    var time: Date
    var type: String
    var park: Park?
    
    init(name: String, desc: String, time: Date, park: Park?, type: String) {
        self.name = name
        self.desc = desc
        self.time = time
        self.park = park
        self.type = type
    }
}

