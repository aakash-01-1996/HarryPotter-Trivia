//
//  ActiveBook.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct ActiveBook: View {
    @State var book: Book
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image(book.image)
                .resizable()
                .scaledToFit()
                .shadow(radius: 7)
            
            Image(systemName: "checkmark.circle.fill")
                .font(.largeTitle)
                .imageScale(.medium)
                .foregroundStyle(.green)
                .padding(3)
            
        }
    }
}

#Preview {
    ActiveBook(book: BookQuestions().books[0])
}
