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
}
