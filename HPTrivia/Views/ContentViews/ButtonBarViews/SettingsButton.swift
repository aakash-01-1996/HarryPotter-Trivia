//
//  SettingsButton.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct SettingsButton: View {
    @State private var showSettings = false
    @Binding var animateViewsIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            if animateViewsIn{
                
                Button {
                    // Settings button
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .shadow(radius: 5)
                    
                }
                .transition(.offset(x: geo.size.width/4))
                .sheet(isPresented: $showSettings) {
                    Settings()
                }
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2.2), value: animateViewsIn)
    }
}

#Preview {
    GeometryReader { geo in
        SettingsButton(animateViewsIn: .constant(true), geo: geo)
    }
}
