//
//  GamePlay.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI
import AVKit

struct GamePlay: View {
    @Environment(Game.self) private var game
    @Environment(\.dismiss) private var dismiss
    
    
    @State private var musicPlayer: AVAudioPlayer!
    @State private var sfxPlayer: AVAudioPlayer!
    @State private var animateViewsIn = false
    
    @State private var revealHint = false
    @State private var revealBook = false
   
    
    var body: some View {
        GeometryReader { geo in
                ZStack {
                    Image("hogwarts")
                        .resizable()
                        .frame(width: geo.size.width * 3, height: geo.size.height * 1.05)
                        .overlay{
                            Rectangle().foregroundColor(.black.opacity(0.75))
                        }
                    
                    VStack {
                        // MARK: Controls
                        HStack {
                            Button("Nox") {
                                game.endGame()
                                dismiss()
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.red.opacity(0.8))
                             
                            Spacer()
                            
                            Text("Score: \(game.gameScore)")
                                .cornerRadius(12)
                                .shadow(color: .gray.opacity(0.4), radius: 4, x: 0, y: 4)
                        }
                        .padding()
                        .padding(.vertical, 50)
                        
                        // MARK: Questions
                        VStack {
                            if animateViewsIn {
                                Text(game.currentQuestion.question)
                                    .font(.custom("PartyLetPlain", size: 50))
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
                                if animateViewsIn {
                                    Image(systemName: "questionmark.app.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                        .foregroundStyle(.cyan)
                                        .padding()
                                        .transition(.offset(x: -geo.size.width/2))
                                        .phaseAnimator([false, true]) {content, phase in
                                            content
                                                .rotationEffect(.degrees(phase ? -11 : -17))
                                        } animation: { _ in
                                                .easeInOut(duration: 0.6)
                                        }
                                        .onTapGesture {
                                            withAnimation(.easeOut(duration: 1)) {
                                                revealHint = true
                                            }
                                            playFlipSound()
                                            game.questionScore -= 1
                                        }
                                        .rotation3DEffect(.degrees(revealHint ? 1440 : 0), axis: (x: 0, y: 1, z: 0))
                                        .scaleEffect(revealHint ? 5 : 1)
                                        .offset(x: revealHint ? geo.size.width/2 : 0)
                                        .opacity(revealHint ? 0 : 1)
                                        .overlay{
                                            Text(game.currentQuestion.hint)
                                                .padding(.leading, 20)
                                                .minimumScaleFactor(0.5)
                                                .multilineTextAlignment(.center)
                                                .opacity(revealHint ? 1 : 0)
                                                .scaleEffect(revealHint ? 1.33 : 1)
                                        }
                                }
                            }
                            .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                            
                            Spacer()
                             
                            VStack {
                                if animateViewsIn {
                                    Image(systemName: "app.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100)
                                        .foregroundStyle(.cyan)
                                        .overlay{
                                            Image(systemName: "book.closed")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 50)
                                                .foregroundStyle(.black)
                                        }
                                        .padding()
                                        .transition(.offset(x: geo.size.width/2))
                                        .phaseAnimator([false, true]) {content, phase in
                                            content
                                                .rotationEffect(.degrees(phase ? 11 : 17))
                                        } animation: { _ in
                                                .easeInOut(duration: 0.6)
                                        }
                                        .onTapGesture {
                                            withAnimation(.easeOut(duration: 1)) {
                                                revealBook = true
                                            }
                                            playFlipSound()
                                            game.questionScore -= 1
                                        }
                                        .rotation3DEffect(.degrees(revealBook ? -1440 : 0), axis: (x: 0, y: 1, z: 0))
                                        .scaleEffect(revealBook ? 5 : 1)
                                        .offset(x: revealBook ? -geo.size.width/2 : 0)
                                        .opacity(revealBook ? 0 : 1)
                                        .overlay {
                                            Image("hp\(game.currentQuestion.book)")
                                                .resizable()
                                                .scaledToFit()
                                                .padding(.trailing, 20)
                                                .opacity(revealBook ? 1 : 0)
                                                .scaleEffect(revealBook ? 1.33 : 1)
                                        }
                                }
                            }
                            .animation(.easeOut(duration: 1.5).delay(2), value: animateViewsIn)
                        }
                        .padding()
                        
                        // MARK: Answers
                        Spacer()
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height)
                    // MARK: Celebration

                }
                .frame(width: geo.size.width, height: geo.size.height)
                .foregroundColor(.white)
                
            }
                .ignoresSafeArea()
                .onAppear{
                    game.startGame()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        animateViewsIn = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.2){
//                        playMusic()
                    }
                }
    }
    private func playMusic() {
        let songs = ["let-the-mystery-unfold", "spellcraft", "deep-in-the-dell", "hiding-place-in-the-forest"]
        
        let song = songs.randomElement()!
        let sound = Bundle.main.path(forResource: song, ofType: "mp3")
        musicPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        musicPlayer.numberOfLoops = -1
        musicPlayer.volume = 0.1
        musicPlayer.play()
    }
    
    private func playFlipSound() {
        let sound = Bundle.main.path(forResource: "page-flip", ofType: "mp3")
        sfxPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        sfxPlayer.play()
    }
    
    private func playWrongSound() {
        let sound = Bundle.main.path(forResource: "negative-beeps", ofType: "mp3")
        sfxPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        sfxPlayer.play()
    }
    
    private func playCorrectSound() {
        let sound = Bundle.main.path(forResource: "magic-wand", ofType: "mp3")
        sfxPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        sfxPlayer.play()
    }
}

#Preview {
    GamePlay()
        .environment(Game())
}
