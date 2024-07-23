//
//  AddActivity.swift
//  HabitTracker
//
//  Created by Günseli Ünsal on 22.07.2024.
//

import SwiftUI

struct AddActivity: View {
    var data: Activities
    
    @State private var title = ""
    @State private var description = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack{
            Form{
//                #warning("COME BACK HERE LATER")
//                #error("I DIDNT UNDERSTAND")
//
                TextField("Title", text: $title)
                TextField("Description", text: $description)
            }
            .navigationTitle("Add Activity")
            .toolbar{
                Button(action: {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else { return }
                    
                    let activity = Activity(title: trimmedTitle, description: description)
                    data.activities.append(activity)
                    dismiss()
                    
                }, label: {
                    Text("Save")
                })
            }
            
        }
    }
}

#Preview {
    AddActivity(data: Activities())
}
