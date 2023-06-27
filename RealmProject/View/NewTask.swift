//
//  NewTask.swift
//  RealmProject
//
//  Created by Вероника Гера on 27.06.2023.
//


import SwiftUI

struct NewTask: View {
    
    let size = UIScreen.main.bounds
    @State var titleOfTask = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: size.height * (0.04)) {
            
            Text("Create New Task")
                .font(.title).bold()
                .padding(.horizontal, size.width * (0.1))
            
            TextField(text: $titleOfTask) {
                Text("Enter name of task")
            }.textFieldStyle(.roundedBorder)
                .padding(.horizontal, size.width * (0.1))
            
            
            Button(action: {
                if titleOfTask != "" {
                    realmManager.addTask(taskTitle: titleOfTask)
                }
                dismiss()
                
            }, label: {
                Text("Add task")
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.0, saturation: 0.4, brightness: 0.992))
                    .cornerRadius(15)
                
            })             .padding(.horizontal, size.width * (0.1))
            
            Spacer()
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.top, size.height * (0.05))
        .background(Color(hue: 0.573, saturation: 0.4, brightness: 0.972))
    }
}

#Preview {
    NewTask()
        .environmentObject(RealmManager())
}
