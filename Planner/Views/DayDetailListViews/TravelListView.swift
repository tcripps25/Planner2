//
//  TravelListView.swift
//  Planner
//
//  Created by Tom Work on 18/02/2024.
//

import SwiftUI

struct TravelListView: View {
    @State var origin: String
    @State var dest: String
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color("interfaceHighlightColor"))
                .frame(maxHeight: .infinity)
                .frame(width: 4)
                .offset(x: 40)
            HStack {
                    getActivityImage(for: "TRAVEL")
                        .frame(width: 35, height: 35)
                        .padding(.leading, 25)
                        .padding(.trailing, 10)
                ZStack(alignment: .leading) {
                   
                    VStack(alignment: .center, spacing: 5) {
                        Text("Switch to \(dest)")
                        
                    }.frame(maxWidth: .infinity).font(.system(size: 12))
                        .opacity(0.7)
                        .padding(.all, 10)
                }.padding(.vertical, 5)
            }
        }.listRowInsets(EdgeInsets())
           
            
    }
}


/*#Preview {
    TravelListView()
}*/
