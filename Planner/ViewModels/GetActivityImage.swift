//
//  GetActivityImage.swift
//  Planner
//
//  Created by Tom Work on 17/02/2024.
//

import Foundation
import SwiftUI

func getActivityImage(for category: String) -> Image {
    switch category {
    case "SHOW":
        return Image(systemName: "ticket.fill")
    case "RESTAURANT":
        return Image(systemName: "fork.knife.circle.fill")
    case "ATTRACTION":
        return Image(systemName: "heart.fill")
    default:
        return Image(systemName: "questionmark.circle.fill")
    }
}
