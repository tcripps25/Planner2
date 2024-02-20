//
//  SetupPlanModel.swift
//  Planner
//
//  Created by Tom Work on 13/02/2024.
//

import Foundation
import SwiftData


func addPlan(modelContext: ModelContext, newPlan: Plan, destinations: [TempDestination], destinationId: String) {
    
    let plan = newPlan
    if let planDestination = destinations.first(where: { $0.id == destinationId }) {
        print("Found item: \(planDestination.name)")
        let name = planDestination.name
        let id = planDestination.id
        let slug = planDestination.slug
        
        var parks = [Park]()
        
        for park in planDestination.parks {
            
            let name = park.name
            let id = park.id
            
            let newPark = Park(id: id, name: name)
            
            parks.append(newPark)
        }
        
        let newDest = Destination(id: id, name: name, slug: slug, parks: parks)
        
        plan.destination = newDest
    } else {
        print("Item not found")
    }
    
    let days = generateDays(startDate: plan.date.start, endDate: plan.date.end)
    
    
    // Directly assign the sorted array to plan.days
    plan.days = days.sorted { $0.date < $1.date }
    
    modelContext.insert(plan)
}
