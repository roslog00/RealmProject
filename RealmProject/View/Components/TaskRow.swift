//
//  TaskRow.swift
//  RealmProject
//
//  Created by Вероника Гера on 27.06.2023.
//
import SwiftUI

struct TaskROw: View {
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: completed ? "checkmark.circle" : "circle")
            
            Text(task)
        }
    }
}

#Preview {
    TaskROw(task: "Do loundry", completed: true)
}
