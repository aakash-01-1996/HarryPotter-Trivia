//
//  InstructionsButton.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct InstructionsButton: View {
    @State private var showInstructions: Bool = false
    
    
    @Binding var animateViewsIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        VStack{
            if animateViewsIn{
                Button {
                    showInstructions.toggle()
                } label:  {
                    Image(systemName: "info.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                }
                .transition(.offset(x: -geo.size.width/4))
                .sheet(isPresented: $showInstructions) {
                    Instructions()
                }
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2.2), value: animateViewsIn)
        .sheet(isPresented: $showInstructions) {
            Instructions()
        }
    }
}

#Preview {
    GeometryReader{ geo in
    InstructionsButton(animateViewsIn: .constant(true), geo: geo)
    }
}
