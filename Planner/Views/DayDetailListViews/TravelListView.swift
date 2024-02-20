//
//  TravelListView.swift
//  Planner
//
//  Created by Tom Work on 18/02/2024.
//

import SwiftUI

struct TravelListView: View {
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.mint)
                .frame(maxHeight: .infinity)
                .frame(width: 5)
                .offset(x: 40)
            HStack {
                    getActivityImage(for: "TRAVEL")
                        .frame(width: 35, height: 35)
                        .padding(.leading, 25)
                        .padding(.trailing, 10)
                ZStack(alignment: .leading) {
                   
                    VStack(alignment: .leading) {
                        Text("Travel from XX to XX")
                            .font(.system(size: 13))
                            .opacity(0.7)
                    }.padding(.all, 10)
                }.padding(.vertical, 5)
            }
        }.listRowInsets(EdgeInsets())
           
            
    }
}


/*#Preview {
    TravelListView()
}*/
