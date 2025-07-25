//
//  ButtonBar.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct ButtonBar: View {
    @Binding var animateViewsIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        HStack {
            Spacer()
            InstructionsButton(animateViewsIn: $animateViewsIn, geo: geo)
            Spacer()
           PlayButton(animateViewsIn: $animateViewsIn, geo: geo)
            Spacer()
            SettingsButton(animateViewsIn: $animateViewsIn, geo: geo)
            Spacer()
        }
    }
}

#Preview {
    GeometryReader { geo in
        ButtonBar(animateViewsIn: .constant(true), geo: geo)
    }
}
