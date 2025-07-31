//
//  RecentScores.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct RecentScores: View {
    @Environment(Game.self) private var game
    
    @Binding var animateViewsIn: Bool
    var body: some View {
        VStack {
            if animateViewsIn {
                
                VStack {
                    Text("Recent Scores")
                        .font(.title2)
                    
                    Text("\(game.recentScores[0])")
                    Text("\(game.recentScores[1])")
                    Text("\(game.recentScores[2])")
                }
                .font(.title3)
                .padding(.horizontal)
                .foregroundColor(.white)
                .background(.black.opacity(0.7))
                .cornerRadius(15)
                .transition(.opacity)
            }
        }
        .animation(.linear(duration: 1).delay(3), value: animateViewsIn)
    }
}

#Preview {
    RecentScores(animateViewsIn: .constant(true))
        .environment(Game())
}
