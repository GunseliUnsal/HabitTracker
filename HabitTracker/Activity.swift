//
//  Activity.swift
//  HabitTracker
//
//  Created by Günseli Ünsal on 22.07.2024.
//

import Foundation


struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example Activity", description: "This is an Example Description")
}
