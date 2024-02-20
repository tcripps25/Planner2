//
//  App.swift
//  Planner
//
//  Created by Tom Work on 15/02/2024.
//

import Foundation

class AppState: ObservableObject {
    enum State {
        case unselected
        case selected(Plan)
    }
    
    @Published var state: State = .unselected
}


