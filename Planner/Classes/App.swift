//
//  App.swift
//  Planner
//
//  Created by Tom Work on 15/02/2024.
//

import Foundation

class App {
    enum State {
        case unselected
        case selected(Plan)
    }
    
    var state: State = .unselected
}


