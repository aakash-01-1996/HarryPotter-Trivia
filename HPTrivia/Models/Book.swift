//
//  Book.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

struct Book: Identifiable {
    let id: Int
    let image: String
    let questions: [Question]
    var status: BookStatus 
    
    enum BookStatus {
        case active
        case inactive
        case locked
    }
}
