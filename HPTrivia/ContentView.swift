//
//  ContentView.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var scalePlayButton = false
    @State private var moveBackgroundImage = false
    @State private var animateViewsIn = false
    
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image("hogwarts")
                    .resizable()
                    .frame(width: geo.size.width * 3, height: geo.size.height)
                    .padding(.top, 3)
                    .offset(x: moveBackgroundImage ? geo.size.width/1.1 : -geo.size.width/1.1)
                    .onAppear{
                        withAnimation(.linear(duration: 60).repeatForever()) {
                            moveBackgroundImage.toggle()
                        }
                    }
                
                VStack {
                    VStack {
                        if animateViewsIn {
                            VStack {
                                Image(systemName: "bolt.fill")
                                    .font(.largeTitle)
                                    .imageScale(.large)
                                
                                Text("Harry Potter")
                                    .font(.custom(Constants.hpFont, size: 70))
                                    .padding(.bottom, -50)
                                
                                Text("Trivia")
                                    .font(.custom(Constants.hpFont, size: 60))
                            }
                            .padding(.top, 55)
                            .transition(.move(edge: .top))
                        }
                    }
                    .animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn)
                    
                    Spacer()
                    
                    VStack {
                        if animateViewsIn {
                            
                            VStack {
                                Text("Recent Scores")
                                    .font(.title2)
                                
                                Text("27")
                                Text("33")
                                Text("40")
                            }
                            .font(.title3)
                            .padding(.horizontal)
                            .foregroundColor(.white)
                            .background(.black.opacity(0.7))
                            .cornerRadius(15)
                            .transition(.opacity)
                        }
                    }
                    .animation(.linear(duration: 1).delay(3), value: animateViewsIn)
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        VStack{
                            if animateViewsIn{
                                Button {
                                    // Show instructions screen
                                } label:  {
                                    Image(systemName: "info.circle")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                }
                                .transition(.offset(x: -geo.size.width/4))
                            }
                        }.animation(.easeOut(duration: 0.7).delay(2.2), value: animateViewsIn)
 
                        Spacer()
                        VStack {
                            if animateViewsIn {
                                Button {
                                    // Start new game
                                } label: {
                                    Text("Play")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .padding(.vertical, 7)
                                        .padding(.horizontal, 50)
                                        .background(Color.brown)
                                        .cornerRadius(8)
                                        .shadow(radius: 5)
                                }
                                .scaleEffect(scalePlayButton ? 1.2 : 1)
                                .onAppear{
                                    withAnimation(.easeInOut(duration: 1.2).repeatForever()) {
                                        scalePlayButton.toggle()
                                    }
                                }
                                .transition(.offset(y:geo.size.height/3))
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2), value: animateViewsIn)
                        
                        Spacer()
                        
                        VStack {
                            if animateViewsIn{
                                
                                Button {
                                    // Settings button
                                } label: {
                                    Image(systemName: "gearshape")
                                        .font(.largeTitle)
                                        .foregroundColor(.white)
                                        .shadow(radius: 5)
                                    
                                }
                                .transition(.offset(x: geo.size.width/4))
                            }
                        }
                        .animation(.easeOut(duration: 0.7).delay(2.2), value: animateViewsIn)
                        Spacer()
                    }
                    .frame(width: geo.size.width)
                    
                    Spacer()
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            animateViewsIn = true
//                playAudio()
        }
    }
    
    private func playAudio() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
        
    }
}

#Preview {
    ContentView()
}
