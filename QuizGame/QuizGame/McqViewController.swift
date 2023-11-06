//
//  McqViewController.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-22.
//

import UIKit

class McqViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet  var answerButton1: RadioButton!
   
    @IBOutlet var answerButton2: RadioButton!
    
    @IBOutlet  var answerButton3: RadioButton!
    
        
    @IBOutlet  var answerButton4: RadioButton!
    
    
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var questions: [QuizQuestion] = [] // Load questions into this array
      var currentQuestionIndex = 0
      var userScore = 0
      var answerButtons: [RadioButton] = [] 
    
    let sampleQuestions: [QuizQuestion] = [
          QuizQuestion(question: "What is the capital of France?", choices: ["Paris", "London", "Berlin", "Madrid"], correctAnswer: 0),
          QuizQuestion(question: "Which planet is known as the Red Planet?", choices: ["Mars", "Venus", "Earth", "Saturn"], correctAnswer: 0),
          QuizQuestion(question: "What is the largest mammal in the world?", choices: ["Elephant", "Giraffe", "Blue Whale", "Lion"], correctAnswer: 2),
          // Add more questions here
      ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerButtons = [answerButton1, answerButton2, answerButton3, answerButton4]
        displayRandomQuestions() 

        // Do any additional setup after loading the view.
    }
    func displayRandomQuestions() {
          // Shuffle the sample questions to randomize their order
          let shuffledQuestions = sampleQuestions.shuffled()

          // Take the first 10 questions
          questions = Array(shuffledQuestions.prefix(10))

          // Display the first question
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
<<<<<<< Updated upstream
        } }
=======
        } else {
            showFinalScore()
        }}
>>>>>>> Stashed changes
    
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
    }

    func restartGame() {
        currentQuestionIndex = 0
        userScore = 0
        displayRandomQuestions()
    }
    
    
    
    
    func showFinalScore() {
        // Transition to the final score view controller to display the user's score.
        let finalScoreVC = self.storyboard?.instantiateViewController(withIdentifier: "FinalScoreViewController") as! FinalScoreViewController
        finalScoreVC.finalScore = userScore
        self.navigationController?.pushViewController(finalScoreVC, animated: true)
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
