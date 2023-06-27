//
//  Content.swift
//  RealmProject
//
//  Created by Вероника Гера on 27.06.2023.
//

import SwiftUI

struct Content: View {
    
    @StateObject var realmManager = RealmManager()
    @State private var addTaskButton = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realmManager)
            
            
            AddButtonCircle()
                .padding()
                .onTapGesture {
                    addTaskButton.toggle()
                }
            
        }.sheet(isPresented: $addTaskButton, content: {
            NewTask()
                .environmentObject(self.realmManager)
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
    }
}

#Preview {
    Content()
}
