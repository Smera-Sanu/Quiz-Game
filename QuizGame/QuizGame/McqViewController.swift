//
//  McqViewController.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-22.
//

import UIKit

class McqViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet  var answerButton1: RadioButton!
    @IBOutlet var answerButton2: RadioButton!
    @IBOutlet  var answerButton3: RadioButton!
    @IBOutlet  var answerButton4: RadioButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var timer: Timer?
    var timeRemaining: Int = 10
    var questions: [QuizQuestion] = []
          var currentQuestionIndex = 0
          var userScore = 0
          var answerButtons: [RadioButton] = []
        
        let sampleQuestions: [QuizQuestion] = [
              QuizQuestion(question: "What is the capital of France?", choices: ["Paris", "London", "Berlin", "Madrid"], correctAnswer: 0),
              QuizQuestion(question: "Which planet is known as the Red Planet?", choices: ["Mars", "Venus", "Earth", "Saturn"], correctAnswer: 0),
              QuizQuestion(question: "What is the largest mammal in the world?", choices: ["Elephant", "Giraffe", "Blue Whale", "Lion"], correctAnswer: 2),
              
          ]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            answerButtons = [answerButton1, answerButton2, answerButton3, answerButton4]
            displayRandomQuestions()
            
            startGame()

           
        }
        func displayRandomQuestions() {
              
              let shuffledQuestions = sampleQuestions.shuffled()

              
              questions = Array(shuffledQuestions.prefix(10))

             
              currentQuestionIndex = 0
              userScore = 0
              displayQuestion()
          }
        
    func displayQuestion() {
        if currentQuestionIndex < questions.count {
            let currentQuestion = questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.question
            
            for (index, button) in answerButtons.enumerated() {
                button.setTitle(currentQuestion.choices[index], for: .normal)
                button.isSelected = false
            }
            updateScoreLabel()
            
        } else {
            showFinalScore()
        }
        timeRemaining = 10
            updateTimer() }
        
        func updateScoreLabel() {
               scoreLabel.text = "Score: \(userScore)"
           }
    @IBAction func answerButtonTapped(_ sender: RadioButton) {
        let currentQuestion = questions[currentQuestionIndex]
                
                    let selectedAnswerIndex = answerButtons.firstIndex(of: sender) ?? -1

                    if selectedAnswerIndex == currentQuestion.correctAnswer {
                        userScore += 1
                        
                        sender.backgroundColor = UIColor.green
                    }else{
                        sender.backgroundColor = UIColor.red
                    }
                        
                for button in answerButtons {
                        button.isEnabled = false
                    }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
                        
                        for button in self?.answerButtons ?? [] {
                            button.backgroundColor = nil
                            button.isEnabled = true
                        }

                        self?.currentQuestionIndex += 1
                        self?.displayQuestion()
                    }
                }
            func startGame() {
                displayRandomQuestions()
                startTimer()
            }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }

    @objc func updateTimer() {
        timeRemaining -= 1
        timerLabel.text = "Time: \(timeRemaining) sec"

        if timeRemaining == 0 {
            
            timer?.invalidate()
            
        }
    }

    func stopTimer() {
        timer?.invalidate()
    }

            func restartGame() {
                currentQuestionIndex = 0
                userScore = 0
                displayRandomQuestions()
            }
            
            
            
            
            func showFinalScore() {
                questionLabel.text = "Quiz Completed!"
                      answerButton1.isHidden  = true
                      answerButton2.isHidden  = true
                      answerButton3.isHidden  = true
                      answerButton4.isHidden  = true
                      let finalScoreText = "Your Score: \(userScore)"
                      scoreLabel.text = finalScoreText
                
                stopTimer()
            }
        }
