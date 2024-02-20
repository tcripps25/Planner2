//
//  DateFormatModel.swift
//  Planner
//
//  Created by Tom Work on 14/02/2024.
//

import Foundation

func formatDate(date: Date) -> String {
    var dateString = ""
    
    let formatter = DateFormatter()
    formatter.dateFormat = "EEEE, d MMM y"

    dateString = formatter.string(from: date)

    return dateString
}
