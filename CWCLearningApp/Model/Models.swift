//
//  Models.swift
//  CWCLearningApp
//
//  Created by Chuck Belcher on 7/24/23.
//

import Foundation

struct Module: Decodable, Identifiable {
    
    var id: Int
    var category: String
    var content: Content
    var test: Test
    
}

struct Content: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lesson]
    
}

struct Lesson: Decodable, Identifiable {
    
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
    
}

struct Test: Decodable, Identifiable {
    
    var id: Int
    var image: String
    var description: String
    var time: String
    var questions: [Question]
    
}

struct Question: Decodable, Identifiable {
    
    var id: Int
    var content: String = "test"
    var correctIndex: Int
    var answers: [String]
    
}
