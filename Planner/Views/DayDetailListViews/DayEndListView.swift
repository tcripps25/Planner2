//
//  DayEndListView.swift
//  Planner
//
//  Created by Tom Work on 19/02/2024.
//

import SwiftUI

struct DayEndListView: View {
    var lastDest: Park?
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .fill(Color("interfaceHighlightColor"))
                    .frame(maxHeight: .infinity)
                    .frame(width: 4)
                    .offset(x: 40)
                Circle()
                    .fill(Color("interfaceHighlightColor"))
                    .frame(width: 15, height: 20)
                    .offset(x: 35, y: -15)
            }
            ZStack(alignment: .leading) {
               
                VStack(alignment: .center, spacing: 5) {
                    if let lastDest {
                        Text("End at \(lastDest.name)")
                    } else {
                        Text("End of the day")
                    }
                    
                }.frame(maxWidth: .infinity).font(.system(size: 12))
                    .opacity(0.7)
                    .padding(.all, 10)
            }.padding(.vertical, 5)
        }.listRowInsets(EdgeInsets())
            .frame(height: 45)
    }
}

#Preview {
    DayEndListView()
}
