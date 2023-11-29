//
//  AddQuestionDelegate.swift
//  QuizGame
//
//  Created by Smera on 2023-11-28.
//

import Foundation

protocol AddQuestionDelegate: AnyObject {
    func addNewQuestion(question: String, options: [String], correctAnswer: Int)
}
