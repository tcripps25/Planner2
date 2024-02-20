//
//  DayEndListView.swift
//  Planner
//
//  Created by Tom Work on 19/02/2024.
//

import SwiftUI

struct DayEndListView: View {
    var body: some View {
        ZStack(alignment: .leading) {
            VStack(alignment: .leading, spacing: 0) {
                Rectangle()
                    .fill(Color.mint)
                    .frame(maxHeight: .infinity)
                    .frame(width: 5)
                    .offset(x: 40)
                Circle()
                    .fill(Color.mint)
                    .frame(width: 15, height: 20)
                    .offset(x: 35, y: -15)
            }
            VStack(alignment: .leading) {
                Text("End day")
                    .font(.system(size: 13))
                    .opacity(0.7)
            }.frame(maxWidth:.infinity)
        }.listRowInsets(EdgeInsets())
            .frame(height: 45)
    }
}

#Preview {
    DayEndListView()
}
