//
//  SelectBooks.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct SelectBooks: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(Game.self) private var game
    
    @State private var showTempAlert = false
    var body: some View {
        ZStack {
            InfoBackgroundImage()
            
            VStack {
                Text("Which books would you like to see questions from?")
                    .font(.title)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .padding(.top)
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(game.bookQuestions.books){ book in
                            if book.status == .active {
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
                                .onTapGesture{
                                    game.bookQuestions.changeStatus(of: book.id, to: .inactive)
                                }
                                
                            } else if book.status == .inactive {
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
                                .onTapGesture{
                                    game.bookQuestions.changeStatus(of: book.id, to: .active)
                                }
                                
                            } else {
                                ZStack {
                                    Image(book.image)
                                        .resizable()
                                        .scaledToFit()
                                        .shadow(radius: 7)
                                        .overlay{
                                            Rectangle().opacity(0.75)
                                        }
                                    
                                    Image(systemName: "lock.fill")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .shadow(color: .white, radius: 2)
                                }
                                .onTapGesture{
                                    // in-app purchases
                                    showTempAlert.toggle()
                                    game.bookQuestions.changeStatus(of: book.id, to: .active)
                                }
                            }
                        }
                    }
                    .padding()
                }
                Button("Done") {
                    dismiss()
                }
                .donebutton()
            }
        }
        .alert("You purchased this book!", isPresented: $showTempAlert){
        }
    }
}

#Preview {
    SelectBooks()
        .environment(Game())
}
