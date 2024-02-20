//
//  TapLabelView.swift
//  Planner
//
//  Created by Tom Work on 11/02/2024.
//

import SwiftUI

struct TapLabelView: View {
    @State private var isTapped = false
    //@Binding var day: Day
    
    var label: String
      var body: some View {
          Button {
              isTapped.toggle()
          } label: {
              ZStack {
                  RoundedRectangle(cornerRadius: 20)
                          .foregroundColor(isTapped ? .blue : .clear)
                    .frame(height: 30) // Adjust the height as needed
                  RoundedRectangle(cornerRadius: 20)
                      .stroke(Color.blue, lineWidth: 2)
                      .frame(height: 30) // Adjust the height as needed
                  Text(label)
                      .foregroundColor(isTapped ? .white : .blue)
                      .padding()
              }
          }
      }
}

#Preview {
    TapLabelView(label: "Test Label")
}
