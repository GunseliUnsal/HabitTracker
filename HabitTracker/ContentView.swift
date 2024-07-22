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
    
    var body: some View {
        NavigationStack{
            List(data.activities) {activity in

            }
            .navigationTitle($title)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

#Preview {
    ContentView()
}
