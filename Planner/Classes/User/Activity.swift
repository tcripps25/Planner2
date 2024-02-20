//
//  UserActivity.swift
//  Planner
//
//  Created by Tom Work on 09/02/2024.
//

import Foundation
import SwiftData

@Model
class UserActivity: Identifiable, Equatable {
    var name: String
    var desc: String
    var time: Date
    
    init(name: String, desc: String, time: Date) {
        self.name = name
        self.desc = desc
        self.time = time
    }
}

