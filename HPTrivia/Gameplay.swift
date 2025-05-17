//
//  Gameplay.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct Gameplay: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                    .overlay(Rectangle().foregroundColor(.black.opacity(0.75)))
                
                VStack {
                    HStack {
                        Button("End Game") {
                            // TODO: End Game
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red.opacity(0.8))
                        
                        Spacer()
                        
                        Text("Score: 28")
                    }
                    .padding()
                    .padding(.vertical, 32)
                    
                    Text("Who is Harry Potter?") // Sample Question
                        .font(.custom(Constants.hpFont, size: 50))
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "questionmark.app.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100)
                            .foregroundColor(.cyan)
                            .rotationEffect(.degrees(-11))
                            .padding()
                            .padding(.leading, 20)
                        
                        Spacer()
                        
                        Image(systemName: "book.closed")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .foregroundColor(.black)
                            .frame(width: 100, height: 100)
                            .background(.cyan)
                            .cornerRadius(20)
                            .rotationEffect(.degrees(11))
                            .padding()
                            .padding(.trailing, 20)
                    }
                    .padding(.bottom)
                    
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(1..<5) { i in
                                Text("Answer \(i)")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .frame(width: geo.size.width/2.15, height: 80)
                                .background(.green.opacity(0.5))
                                .cornerRadius(25)
                        }
                    }
                    
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundColor(.white)
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    Gameplay()
}
