//
//  Gameplay.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct Gameplay: View {
    @Environment(\.dismiss) private var dismiss
    @State private var animateViewsIn = false
    @State private var correctAnswer = false
    @State private var hintWiggle = false
    
    @State private var scaleNextButton = false
    @State private var movePointsToScore = false
    
    @State private var revealHint = false
    @State private var revealBook = false
    
    var body: some View {
        GeometryReader { geo in
                ZStack {
                    Image("hogwarts")
                        .resizable()
                        .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                        .overlay(Rectangle().foregroundColor(.black.opacity(0.75)))
                    
                    VStack {
                        // MARK: Controls
                        HStack {
                            Button("Nox") {
                                dismiss()
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.red.opacity(0.8))
                            
                            Spacer()
                            
                            Text("House Pts: 28")
                                .foregroundColor(.white)
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 4)
                                
                        }
                        .padding()
                        .padding(.vertical, 50)
                        
                        // MARK: Questions
                        VStack {
                            if animateViewsIn{
                                Text("Who is Harry Potter?") // Sample Question
                                    .font(.custom(Constants.hpFont, size: 50))
                                    .multilineTextAlignment(.center)
                                    .padding()
                                    .transition(.scale)
                            }
                        }
                        .animation(.easeInOut(duration: 2), value: animateViewsIn)
                        
                        Spacer()
                        // MARK: Hints
                        HStack {
                            VStack {
                                if animateViewsIn{
                                    Image(systemName: "questionmark.app.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                        .foregroundColor(.cyan)
                                        .rotationEffect(.degrees(hintWiggle ? -11 : -17))
                                        .padding()
                                        .padding(.leading, 20)
                                        .transition(.offset(x: -geo.size.width/2))
                                        .onAppear {
                                            withAnimation(.easeInOut(duration: 0.1).repeatCount(9).delay(3).repeatForever()) {
                                                hintWiggle = true
                                            }
                                        }
                                        .onTapGesture {
                                            withAnimation(.easeOut(duration: 1)) {
                                                revealHint = true
                                            }
                                        }
                                        .rotation3DEffect(.degrees(revealHint ? 1440 : 0), axis: (x: 0, y: 1, z: 0))
                                        .scaleEffect(revealHint ? 5: 1)
                                        .opacity(revealHint ? 0 : 1)
                                        .offset(x: revealHint ? geo.size.width/2 : 0)
                                        .overlay(
                                            Text("The Boy who Lived")
                                                .padding(.leading, 33)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .opacity(revealHint ? 1 : 0)
                                                .scaleEffect(revealHint ? 1.33 : 1)
                                        )
                                }
                            }
                            .animation(.easeOut(duration:1.7).delay(2), value: animateViewsIn)
                            
                            Spacer()
                            
                            VStack {
                                if animateViewsIn{
                                    Image(systemName: "book.closed")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50)
                                        .foregroundColor(.black)
                                        .frame(width: 100, height: 100)
                                        .background(.cyan)
                                        .cornerRadius(20)
                                        .rotationEffect(.degrees(hintWiggle ? 11 : 17))
                                        .padding()
                                        .padding(.trailing, 20)
                                        .transition(.offset(x: geo.size.width/2))
                                        .onAppear {
                                            withAnimation(.easeInOut(duration: 0.1).repeatCount(9).delay(3).repeatForever()) {
                                                hintWiggle = true
                                            }
                                        }
                                        .onTapGesture {
                                            withAnimation(.easeOut(duration: 1)) {
                                                revealBook = true
                                            }
                                        }
                                        .rotation3DEffect(.degrees(revealBook ? 1440 : 0), axis: (x: 0, y: 1, z: 0))
                                        .scaleEffect(revealBook ? 5: 1)
                                        .opacity(revealBook ? 0 : 1)
                                        .offset(x: revealBook ? -geo.size.width/2 : 0)
                                        .overlay(
                                            Image("hp1")
                                                .resizable()
                                                .scaledToFit()
                                                .padding(.trailing, 33)
                                                .opacity(revealBook ? 1 : 0)
                                                .scaleEffect(revealBook ? 1.33 : 1)
                                        )
                                }
                            }
                            .animation(.easeOut(duration:1.7).delay(2), value: animateViewsIn)
                        }
                        .padding(.bottom)
                        
                        // MARK: Answers
                        LazyVGrid(columns: [GridItem(), GridItem()]) {
                            ForEach(1..<5) { i in
                                VStack {
                                    if animateViewsIn{
                                        Text("Answer \(i)")
                                            .minimumScaleFactor(0.5)
                                            .multilineTextAlignment(.center)
                                            .padding(10)
                                            .frame(width: geo.size.width/2.15, height: 80)
                                            .background(.green.opacity(0.5))
                                            .cornerRadius(25)
                                            .transition(.scale)
                                    }
                                }
                                .animation(.easeOut(duration: 1).delay(1.4), value: animateViewsIn)
                            }
                        }
                        
                        Spacer()
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    .foregroundColor(.white)
                    
                    // MARK: Celebration
                    VStack {
                        Spacer()
                        
                        VStack {
                            if correctAnswer{
                                Text("5")
                                    .font(.largeTitle)
                                    .padding(.top, 40)
                                    .transition(.offset(y: -geo.size.height/4))
                                    .offset(x: movePointsToScore ? geo.size.width/2.5 : 0, y: movePointsToScore ? -geo.size.height/15 : 0)
                                    .opacity(movePointsToScore ? 0 : 1)
                                    .onAppear {
                                        withAnimation(.easeInOut(duration: 1).delay(3)) {
                                            movePointsToScore = true
                                        }
                                    }
                            }
                        }
                        .animation(.easeInOut(duration: 1).delay(2), value: correctAnswer)
                        
                        Spacer()
                        
                        VStack{
                            if correctAnswer{
                                Text("Brilliant!")
                                    .font(.custom(Constants.hpFont, size: 100))
                                    .transition(.scale.combined(with: .offset(y: -geo.size.height/2)))
                            }
                        }
                        .animation(.easeInOut(duration:1).delay(1), value: correctAnswer)
                            
                        
                        Spacer()
                        
                        if correctAnswer {
                            Text("Answer 1")
                                .minimumScaleFactor(0.5)
                                .multilineTextAlignment(.center)
                                .padding(10)
                                .frame(width: geo.size.width/2.15, height: 80)
                                .background(.green.opacity(0.5))
                                .cornerRadius(25)
                                .scaleEffect(2)
                        }
                        
                        Group {
                            Spacer()
                            Spacer()
                        }
                        
                        VStack{
                            if correctAnswer {
                                Button("Next Level > ") {
                                    // TODO: reset level for next question
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.blue.opacity(0.5))
                                .font(.largeTitle)
                                .transition(.offset(y: geo.size.height/3))
                                .scaleEffect(scaleNextButton ? 1.2 : 1)
                                .onAppear{
                                    withAnimation(.easeInOut(duration: 1.2).repeatForever()) {
                                        scaleNextButton.toggle()
                                    }
                                }
                            }
                        }.animation(.easeInOut(duration: 2.3).delay(2.3), value: correctAnswer)
                        
                        Group {
                            Spacer()
                            Spacer()
                        }
                    }
                    .foregroundColor(.white)
                }
                .frame(width: geo.size.width, height: geo.size.height)
            }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
//            correctAnswer = true
        }
    }
}

#Preview {
    Gameplay()
}
