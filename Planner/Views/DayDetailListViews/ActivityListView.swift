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
                .fill(Color("interfaceHighlightColor"))
                .frame(width: 4)
                .frame(maxHeight: .infinity)
                .offset(x: 40)
            HStack {
                ZStack {
                    ZStack {
                        getActivityImage(for: activity.type)
                            .frame(width: 35, height: 35)
                            .padding(.leading, 25)
                            .padding(.trailing, 10)
                    }
                }
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color("surfaceColor"))
                    HStack {
                        
                        Spacer()
                        Rectangle()
                            .fill(Color("surfaceColor"))
                    }
                    
                        VStack(alignment: .leading) {
                            HStack {
                                Label(activity.time.formatted(date: .omitted, time: .shortened), systemImage: "clock")
                                    .labelStyle(.titleOnly)
                                    .font(.system(size: 15))
                                    .fontWeight(.medium)
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                
                                HStack {
                                    Spacer()
                                    HStack {
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                    }.padding(.horizontal, 10)
                                        .padding(.top, 5)
                                }

                            }.padding(.bottom, 5)
                            HStack {
                                Text(activity.name)
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .opacity(0.8)
                            }.padding(.horizontal, 10)
                            
                            HStack {
                                
                                HStack {
                                    if !activity.desc.isEmpty {
                                    
                                    Label {
                                        Text("Notes for this item")
                                    } icon: {
                                        Image(systemName: "note.text")
                                            .resizable()
                                            .scaledToFit()
                                    }.labelStyle(.iconOnly)
                                    }
                                    
                                }.frame(height: 13)
                                Spacer()
                                Label {
                                    Text("\(activity.park!.name)")
                                    
                                    
                                } icon: {
                                    Image(systemName: (day.parks?.contains(activity.park!)) == false ? "calendar.badge.exclamationmark" : "calendar")
                                        .frame(height: 12)
                                        .scaledToFit()
                                }.fontWeight(.medium)
                                    .frame(height: 18)
                                    .lineLimit(1)
                                    .foregroundColor(Color("interfaceTextHighlightColor").opacity(0.9))
                                    .font(.system(size: 13))
                                    .padding(.vertical, 5)
                                    .padding(.horizontal, 10)
                                    .background {
                                        UnevenRoundedRectangle(cornerRadii: .init(topLeading: 10), style: .continuous)
                                            .fill((day.parks?.contains(activity.park!) == false) ? Color.orange : Color.accentColor)
                                        
                                    }
                            }.padding(.leading, 10)
                        }
                    
                }.padding(.vertical, 5)
            }
        }.listRowInsets(EdgeInsets())
           
            
    }
}


