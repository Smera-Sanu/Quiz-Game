//
//  PlayViewController.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-22.
//

import UIKit

class PlayViewController: UIViewController {
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    var questions: [String] = ["What is the capital of France?",
                                   "Which planet is known as the Red Planet?",
                                   "What is the largest mammal in the world?",]
        var answers: [String] = [
                "Paris",
                "Mars",
                "Blue Whale",
            ]
            var currentQuestionIndex = 0
            var userScore = 0
        var timer: Timer?
        var timeRemaining: Int = 30
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayRandomQuestion()
        startTimer()
    }
    func displayRandomQuestion() {
           if currentQuestionIndex < questions.count {
               let randomQuestion = questions[currentQuestionIndex]
               questionLabel.text = randomQuestion
           } else {
               showFinalScore()
           }
       }

       func showFinalScore() {
           questionLabel.text = "Quiz Completed!"
           answerTextField.isHidden = true
           let finalScoreText = "Your Score: \(userScore)"
           scoreLabel.text = finalScoreText
           stopTimer()
       }

       @IBAction func submitAnswer(_ sender: UIButton) {
           guard currentQuestionIndex < questions.count else {
               return // No more questions to answer
           }

           let currentQuestion = questions[currentQuestionIndex]
           let userAnswer = answerTextField.text ?? ""
           let correctAnswer = answers[currentQuestionIndex]

           if userAnswer.lowercased() == correctAnswer.lowercased() {
               // Correct answer
               userScore += 1
               print("Correct Answer! Score: \(userScore)")
                } else {
                    print("Incorrect Answer. User Answer: \(userAnswer), Correct Answer: \(currentQuestion)")
                
           }

           currentQuestionIndex += 1
           answerTextField.text = ""
           updateScoreLabel()
           displayRandomQuestion()
       }
    func startTimer() {
          timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
      }
    @objc func updateTimer() {
          timeRemaining -= 1
          if timeRemaining >= 0 {
              timerLabel.text = "Time: \(timeRemaining) sec"
          } else {
              timerLabel.text = "Time's up!"
              stopTimer()
          }
      }

     

       func updateScoreLabel() {
           scoreLabel.text = "Score: \(userScore)"
       }
    func stopTimer() {
        timer?.invalidate()
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
