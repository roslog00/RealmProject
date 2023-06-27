//
//  TaskView.swift
//  RealmProject
//
//  Created by Вероника Гера on 27.06.2023.
//

import SwiftUI

struct TaskView: View {
    
    @EnvironmentObject var realmManager: RealmManager
    
    var body: some View {
        VStack{
            Text("My task")
                .font(.title3.bold())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            List {
                ForEach(realmManager.tasks, id: \.id){ task in
                    
                    if !task.isInvalidated {
                        TaskROw(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }.swipeActions(edge: .trailing){
                                Button(role: .destructive) {
                                    realmManager.deletTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                
                            }
                    }
                    
                    
                }
            }.onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.573, saturation: 0.4, brightness: 0.972))
    }
}

#Preview {
    TaskView()
        .environmentObject(RealmManager())
}
