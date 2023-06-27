//
//  AddButtonCircle.swift
//  RealmProject
//
//  Created by Вероника Гера on 27.06.2023.
//


import SwiftUI

struct AddButtonCircle: View {
    
    private let size = UIScreen.main.bounds
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: size.width * (0.2))
                .foregroundStyle(Color(hue: 0.612, saturation: 0.964, brightness: 0.535))
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .frame(width: size.width * (0.1), height: size.width * (0.1))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    AddButtonCircle()
}
