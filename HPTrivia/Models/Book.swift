//
//  Book.swift
//  HPTrivia
//
//  Created by Aakash Ambodkar
//

struct Book: Codable, Identifiable {
    let id: Int
    let image: String
    let questions: [Question]
    var status: BookStatus 
    
    
}
enum BookStatus: Codable {
    case active
    case inactive
    case locked
}
