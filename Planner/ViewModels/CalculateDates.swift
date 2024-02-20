//
//  CalculateDates.swift
//  Planner
//
//  Created by Tom Work on 10/02/2024.
//

import Foundation

// Function to generate an array of Day objects for each day in a date interval
func generateDays(startDate: Date, endDate: Date) -> [Day] {
    var days: [Day] = []
    
    // Iterate through each day in the date interval
    var currentDate = startDate
    while currentDate <= endDate {
        let day = Day(date: currentDate, activities: [], parks: [], id: UUID())
        days.append(day)
        
        // Move to the next day
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate)!
    }

    return days
}

