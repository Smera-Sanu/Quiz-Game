//
//  QuizQuestion.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-22.
//

import Foundation
struct QuizQuestion : Codable {
    var question: String
    var choices: [String]
    var correctAnswer: Int
    var hint: String?
}
struct QuizItem {
    var question: String
    var answer: String
    var hint: String
}
