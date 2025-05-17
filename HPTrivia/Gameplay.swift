//
//  Gameplay.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct Gameplay: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay(Rectangle().foregroundColor(.black.opacity(0.5)))
                
                VStack {
                    HStack {
                        Button("End Game") {
                            // TODO: End Game
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.8))
                        
                        Spacer()
                        
                        Text("Score: 0")
                    }
                    .padding()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundColor(.white)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Gameplay()
}
