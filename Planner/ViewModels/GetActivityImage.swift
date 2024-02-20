//
//  ActivityImage.swift
//  Planner
//
//  Created by Tom Work on 17/02/2024.
//

import Foundation
import SwiftUI

func getActivityImage(for category: String) -> some View {
    var symbolName: String
    var color: Color
    
    switch category {
    case "SHOW":
        symbolName = "theatermasks.fill"
        color = Color.blue.opacity(0.8)
        
    case "RESTAURANT":
        symbolName = "fork.knife"
        color = Color.teal
        
    case "ATTRACTION":
        symbolName = "ticket.fill"
        color = Color.orange.opacity(0.8)
        
    case "NOVISIT":
        symbolName = "exclamationmark"
        color = Color.red
        
    case "TRAVEL":
        symbolName = "figure.walk"
        color = Color.mint
        
    default:
        symbolName = "questionmark.circle.fill"
        color = Color.black
    }
    
    return ZStack(alignment: .center) {
        Circle()
            .fill(Color("interfaceHighlightColor"))
            .frame(width: 41, height: 41)
        Circle()
            .fill(Color("surfaceColor"))
            .frame(width: 35, height: 35)
            .overlay (
                Image(systemName: symbolName)
                    .frame(width: 13, height: 13)
                    .scaledToFit()
                    .foregroundColor(color)
            )
        }
    }
   
