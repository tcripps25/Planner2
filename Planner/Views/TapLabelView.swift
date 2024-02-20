//
//  TapLabelView.swift
//  Planner
//
//  Created by Tom Work on 11/02/2024.
//

import SwiftUI

struct TapLabelView: View {
    @State private var isTapped = false
    @Binding var day: Day
    var park: Park
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(isTapped ? .blue : Color("surfaceColor"))
                .overlay(
                    Group {
                        
                        HStack {
                            Spacer()
                            Image(systemName: "ticket.fill")
                                .font(.system(size: 90))
                                .opacity(0.1)
                                .rotationEffect(Angle(degrees: 135))
                                .offset(x: isTapped ? 20 : 30)
                            
                        }.opacity(isTapped ? 1 : 0)
                    }
                )
            
            Text(park.name)
                .fontWeight(.semibold)
                .foregroundStyle(isTapped ? Color.white.opacity(0.8) : Color.black.opacity(0.8))
                .multilineTextAlignment(.leading)
        }.clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .frame(width: 200, height: 60)
            .onTapGesture {
                withAnimation {
                    isTapped.toggle()
                }
                
                if let index = day.parks?.firstIndex(where: { $0.id == park.id }) {
                    day.parks?.remove(at: index)
                } else {
                    day.parks?.append(park)
                }
            }
            .onAppear {
                if day.parks!.contains(park) {
                    isTapped = true
                }
            }
    }
}

/*#Preview {
    TapLabelView(label: "Test Label")
}*/
