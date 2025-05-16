//
//  Constants.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import Foundation
import SwiftUI

enum Constants {
    static let hpFont = "PartyLetPlain"
}

struct InfoBackgroundImage: View {
    var body: some View {
        Image("parchment")
            .resizable()
            .ignoresSafeArea()
            .background(.brown)
    }
}


extension Button {
    func donebutton() -> some View {
        self
            .font(.title2)
            .buttonStyle(.borderedProminent)
            .tint(.brown)
            .foregroundColor(.white)
    }
}
