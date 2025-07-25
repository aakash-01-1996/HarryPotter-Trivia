//
//  Question.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

struct Question: Decodable {
    let id: Int
    let question: String
    let answer: String
    let wrong: [String]
    let book: Int
    let hint: String
}
