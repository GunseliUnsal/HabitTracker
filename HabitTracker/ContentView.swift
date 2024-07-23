//
//  ContentView.swift
//  HabitTracker
//
//  Created by Günseli Ünsal on 22.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var title = "Habit Tracker"
    
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    var body: some View {
        NavigationStack{
            List(data.activities) {activity in
                NavigationLink{
                    ActivityView(data: data, activity: activity)
                } label: {
                    HStack{
                        Text(activity.title)
                        Spacer()
                        Text(String(activity.completionCount))
                            .font(.caption.weight(.black))
                            .padding(5)
                            .frame(minWidth: 50)
                            .background(color(for: activity))
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                }
            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                Button(action: {
                    addingNewActivity.toggle()
                }, label: {
                    Image(systemName: "plus")
                        .font(.title2)
                        .foregroundStyle(.black)
                })
            }.sheet(isPresented: $addingNewActivity, content: {
                AddActivity(data: data)
            })
        }
    }
    func color(for activity: Activity) -> Color {
        if activity.completionCount < 3 {
            return .red
        } else if activity.completionCount < 10 {
            return .orange
        } else if activity.completionCount < 20 {
            return .green
        } else if activity.completionCount < 50 {
            return .blue
        } else {
            return .indigo
        }
    }
    
}

#Preview {
    ContentView()
}
