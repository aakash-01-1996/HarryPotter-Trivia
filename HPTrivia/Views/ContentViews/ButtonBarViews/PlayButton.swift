//
//  PlayButton.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct PlayButton: View {
    @State private var playGame = false
    @State private var scalePlayButton = false
    @Binding var animateViewsIn: Bool

    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            if animateViewsIn {
                Button {
                    // Start new game
                    playGame.toggle()
                } label: {
                    Text("Play")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 50)
                        .background(Color.brown)
                        .cornerRadius(8)
                        .shadow(radius: 5)
                }
                .scaleEffect(scalePlayButton ? 1.2 : 1)
                .onAppear{
                    withAnimation(.easeInOut(duration: 1.2).repeatForever()) {
                        scalePlayButton.toggle()
                    }
                }
                .transition(.offset(y:geo.size.height/3))
                .fullScreenCover(isPresented: $playGame) {
                    Gameplay()
                }
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn)
        
    }
}

#Preview {
    GeometryReader {geo in
        PlayButton(animateViewsIn: .constant(true), geo: geo)
    }
}
