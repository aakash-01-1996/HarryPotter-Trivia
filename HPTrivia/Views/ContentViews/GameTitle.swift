//
//  GameTitle.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct GameTitle: View {
    @Binding var animateViewsIn: Bool
    
    var body: some View {
        VStack {
            if animateViewsIn {
                VStack {
                    Image(systemName: "bolt.fill")
                        .font(.largeTitle)
                        .imageScale(.large)
                    
                    Text("Harry Potter")
                        .font(.custom(Constants.hpFont, size: 70))
                        .padding(.bottom, -50)
                    
                    Text("Trivia")
                        .font(.custom(Constants.hpFont, size: 60))
                }
                .padding(.top, 55)
                .transition(.move(edge: .top))
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn)
    }
}

#Preview {
    GameTitle(animateViewsIn: .constant(true))
}
