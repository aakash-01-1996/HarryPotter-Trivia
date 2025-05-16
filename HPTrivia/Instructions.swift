//
//  Instructions.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

import SwiftUI

struct Instructions: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            InfoBackgroundImage()
            
            VStack {
                Image("appiconwithradius")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .padding(.top)
                
                
                ScrollView {
                    Text("How To Play")
                        .font(.largeTitle)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text("Welcome to Harry Potter Trivia! In this game, you will be asked random questions from the HP books and you must guess the right answer or you will lose points!😱")
                            .padding([.horizontal, .bottom])
                        
                        Text("Each question i worth 5 points, but if you guess a wrong answer, you lose 1 point")
                            .padding([.horizontal, .bottom])
                        
                        Text("If you are struggling with a question, there is an option to reveal a hint or reveal the book that book that answers the question. But beware! Using these also minuses 1 point each")
                            .padding([.horizontal, .bottom])
                        
                        Text("When you select the correct answer, you will be rewarded all the points left for that question amd they will be added to your total score.")
                            .padding([.horizontal])
                    }
                    .font(.title3)
                    
                    
                    Text("Good Luck!")
                        .font(.title)
                    
                }
                .foregroundColor(.black)
                
                Button("Done") {
                    dismiss()
                }
                .donebutton()
                
            }
        }
    }
}

#Preview {
    Instructions()
}
