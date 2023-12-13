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
    @IBOutlet weak var lblHint: UILabel!
    @IBOutlet weak var btnHint: UIButton!
    
    struct QuizItem {
        var question: String
        var answer: String
        var hint: String
    }
    var quizItems: [QuizItem] = [
            QuizItem(question: "Which actor played the character of Tony Stark in the Marvel Cinematic Universe?",
                     answer: "Robert Downey Jr.",
                     hint: "He is also known as Iron Man."),
            QuizItem(question: "What is the highest-grossing film of all time?",
                     answer: "Avengers: Endgame",
                     hint: "This film features a large ensemble cast of superheroes."),
            QuizItem(question: "Who is known as the 'King of Pop'?",
                     answer: "Michael Jackson",
                     hint: "His famous albums include 'Thriller' and 'Bad'."),
            QuizItem(question: "In which year did the first episode of 'Friends' air?",
                     answer: "1994",
                     hint: "The show revolves around a group of six friends living in New York."),
            QuizItem(question: "What is the name of the wizarding school in the Harry Potter series?",
                     answer: "Hogwarts",
                     hint: "The school is known for its magical education."),
            QuizItem(question: "Which film features a toy cowboy named Woody?",
                                answer: "Toy Story",
                                hint: "The main character is a pull-string cowboy doll.")
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
    @IBAction func btnHintTapped(_ sender: UIButton) {
        
        lblHint.isHidden = false
    }
    func displayRandomQuestion() {
//        lblHint.isHidden = true
//           if currentQuestionIndex < questions.count {
//               let randomQuestion = questions[currentQuestionIndex]
//               questionLabel.text = randomQuestion
//               lblHint.text = "Hint: \(randomQuestion.hint ?? "")"   }
//        else {
//               showFinalScore()
//           }
//       }
        lblHint.isHidden = true
            if currentQuestionIndex < quizItems.count {
                let randomQuizItem = quizItems[currentQuestionIndex]
                questionLabel.text = randomQuizItem.question
                lblHint.text = "Hint: \(randomQuizItem.hint)"
            } else {
             
                showFinalScore()
            }
        }


       func showFinalScore() {
           lblHint.isHidden = true
           questionLabel.text = "Quiz Completed!"
           answerTextField.isHidden = true
           let finalScoreText = "Your Score: \(userScore)"
           scoreLabel.text = finalScoreText
           stopTimer()
       }

       @IBAction func submitAnswer(_ sender: UIButton) {
           guard currentQuestionIndex < quizItems.count else {
                   return // No more questions to answer
               }

               let currentQuizItem = quizItems[currentQuestionIndex]
               let userAnswer = answerTextField.text ?? ""
               let correctAnswer = currentQuizItem.answer

               if userAnswer.lowercased() == correctAnswer.lowercased() {
                   // Correct answer
                   userScore += 1
                   print("Correct Answer! Score: \(userScore)")
               } else {
                   print("Incorrect Answer. User Answer: \(userAnswer), Correct Answer: \(correctAnswer)")
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
