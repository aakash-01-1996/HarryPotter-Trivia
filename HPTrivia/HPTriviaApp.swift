//
//  HPTriviaApp.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

@main
struct HPTriviaApp: App {
    private var game = Game()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(game)
        }
    }
}

/***
 App Dev Plan: 
 - Game Intro screen -> Done
 - Gameplay screen -> Done
 - Game Logic (questions, scores, etc) -> Done
 - Celebration -> Done
 - Audio -> Done
 - Animation -> Done
 - In-app purchases -> Done
 - Instrcutions screen -> Done
 - Books -> Done
 - Persist scores -> Done
 */
