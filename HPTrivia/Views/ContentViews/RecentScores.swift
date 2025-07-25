//
//  RecentScores.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct RecentScores: View {
    @Binding var animateViewsIn: Bool
    var body: some View {
        VStack {
            if animateViewsIn {
                
                VStack {
                    Text("Recent Scores")
                        .font(.title2)
                    
                    Text("27")
                    Text("33")
                    Text("40")
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
}
