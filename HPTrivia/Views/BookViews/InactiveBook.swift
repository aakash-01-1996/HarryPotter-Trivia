//
//  InactiveBook.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct InactiveBook: View {
    @State var book: Book
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
                .overlay{
                    Rectangle().opacity(0.37)
                }
            
            Image(systemName: "circle")
                .font(.largeTitle)
                .imageScale(.medium)
                .foregroundStyle(.green.opacity(0.5))
                .padding(3)
        }
    }
}

#Preview {
    InactiveBook(book: BookQuestions().books[0])
}
