//
//  ActivityListView.swift
//  Planner
//
//  Created by Tom Work on 17/02/2024.
//

import SwiftUI

struct ActivityListView: View {
    var activity: Activity
    var day: Day
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color.mint)
                .frame(width: 5)
                .frame(maxHeight: .infinity)
                .offset(x: 40)
            HStack {
                if ((day.parks?.contains(activity.park!)) == true) {
                    getActivityImage(for: activity.type)
                        .frame(width: 35, height: 35)
                        .padding(.leading, 25)
                        .padding(.trailing, 10)
                } else {
                    getActivityImage(for: "NOVISIT")
                        .frame(width: 35, height: 35)
                        .padding(.leading, 25)
                        .padding(.trailing, 10)
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.white)
                    HStack{
                        Spacer()
                        Rectangle()
                            .fill(Color.white)
                    }
                    VStack(alignment: .leading) {
                        Text(activity.name)
                            .font(.system(size: 16))
                            .fontWeight(.medium)
                        Text("\(activity.park!.name)")
                            .font(.system(size: 13))
                    }.padding(.all, 10)
                }.padding(.vertical, 5)
            }
        }.listRowInsets(EdgeInsets())
           
            
    }
}


