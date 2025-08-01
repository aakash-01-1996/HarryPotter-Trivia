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
    private var store = Store()
    
    var activeBooks: Bool {
        for book in game.bookQuestions.books {
            if book.status == .active {
                return true
            }
        }
        return false
    }
    
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
                            if book.status == .active || (book.status == .locked && store.purchased.contains(book.image))  {
                                ActiveBook(book: book)
                                    .task{
                                        game.bookQuestions.changeStatus(of: book.id, to: .active)
                                    }
                                    .onTapGesture{
                                    game.bookQuestions.changeStatus(of: book.id, to: .inactive)
                                }
                            } else if book.status == .inactive {
                                InactiveBook(book: book)
                                    .onTapGesture{
                                        game.bookQuestions.changeStatus(of: book.id, to: .active)
                                    }
                                
                            } else {
                                LockedBook(book: book)
                                    .onTapGesture{
                                        let product = store.products[book.id-4]
                                        
                                        Task {
                                             await store.purchase(product)
                                        }
                                    }
                            }
                        }
                    }
                    .padding()
                }
                if !activeBooks {
                    Text("No Books Selected")
                        .multilineTextAlignment(.center)
                }
                
                Button("Done") {
                    dismiss()
                }
                .font(.title)
                .buttonStyle(.borderedProminent)
                .tint(.brown.mix(with: .black, by: 0.2))
                .foregroundStyle(.white)
                .disabled(!activeBooks)

            }
        }
        .interactiveDismissDisabled(!activeBooks)
        .task {
            await store.loadProducts()
        }
    }
}

#Preview {
    SelectBooks()
        .environment(Game())
}
