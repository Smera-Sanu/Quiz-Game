//
//  McqViewController.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-22.
//

import UIKit

class McqViewController: UIViewController , AddQuestionDelegate{
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet  var answerButton1: RadioButton!
    @IBOutlet var answerButton2: RadioButton!
    @IBOutlet  var answerButton3: RadioButton!
    @IBOutlet  var answerButton4: RadioButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var btnHint: UIButton!
    @IBOutlet weak var lblHint: UILabel!
    var flag = 0
    var timer: Timer?
    var timeRemaining: Int = 10
    var questions: [QuizQuestion] = []
          var currentQuestionIndex = 0
          var userScore = 0
          var answerButtons: [RadioButton] = []
        
    var sampleQuestions: [QuizQuestion] = [
        QuizQuestion(question: "Which actor played the character of Tony Stark in the Marvel Cinematic Universe?", choices: ["Chris Hemsworth", "Chris Evans", "Robert Downey Jr.", "Mark Ruffalo"], correctAnswer: 2, hint: "He is also known as Iron Man."),
            QuizQuestion(question: "What is the highest-grossing film of all time?", choices: ["Avengers: Endgame", "Avatar", "Titanic", "The Lion King"], correctAnswer: 0, hint: "This film features a large ensemble cast of superheroes."),
            QuizQuestion(question: "Who is known as the 'King of Pop'?", choices: ["Prince", "Michael Jackson", "Elvis Presley", "Madonna"], correctAnswer: 1, hint: "His famous albums include 'Thriller' and 'Bad'."),
            QuizQuestion(question: "In which year did the first episode of 'Friends' air?", choices: ["1990", "1994", "1998", "2002"], correctAnswer: 1, hint: "The show revolves around a group of six friends living in New York."),
            QuizQuestion(question: "What is the name of the wizarding school in the Harry Potter series?", choices: ["Hogwarts", "Durmstrang", "Beauxbatons", "Ilvermorny"], correctAnswer: 0, hint: "The school is known for its magical education."),

        QuizQuestion(question: "Which film features a toy cowboy named Woody?",
                     choices: ["Toy Story", "WallE", "Lion King", "Moana"],
                     correctAnswer: 0,
                     hint: "The main character is a pull-string cowboy doll.")

          ]
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            answerButtons = [answerButton1, answerButton2, answerButton3, answerButton4]
            displayRandomQuestions()
            
            startGame()
        
                   
                   // Load questions from UserDefaults
                   loadQuestionsFromUserDefaults()
                   
                   // Ensure the initial display of questions includes the loaded ones
                   displayRandomQuestions()
                   // Other setup as needed

           
        }
    
    
    func loadQuestionsFromUserDefaults() {
        if let savedQuestionsData = UserDefaults.standard.data(forKey: "savedQuestions") {
            let decoder = JSONDecoder()
            if let loadedQuestions = try? decoder.decode([QuizQuestion].self, from: savedQuestionsData) {
                sampleQuestions = loadedQuestions
            }
        }
    }

        func displayRandomQuestions() {
              
              let shuffledQuestions = sampleQuestions.shuffled()

              
              questions = Array(shuffledQuestions.prefix(10))

             
              currentQuestionIndex = 0
              userScore = 0
              displayQuestion()
          }
        
    @IBAction func btnHintTapped(_ sender: UIButton) {
        lblHint.isHidden = false
    }
    func displayQuestion() {
        lblHint.isHidden = true 
        if currentQuestionIndex < questions.count {
            let currentQuestion = questions[currentQuestionIndex]
            questionLabel.text = currentQuestion.question
            
            for (index, button) in answerButtons.enumerated() {
                button.setTitle(currentQuestion.choices[index], for: .normal)
                button.isSelected = false
            }
            
            lblHint.text = "Hint: \(currentQuestion.hint ?? "")" // Set the hint text

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
                btnHint.isHidden = true
                questionLabel.text = "Quiz Completed!"
                      answerButton1.isHidden  = true
                      answerButton2.isHidden  = true
                      answerButton3.isHidden  = true
                      answerButton4.isHidden  = true
                      let finalScoreText = "Your Score: \(userScore)"
                      scoreLabel.text = finalScoreText
                
                stopTimer()
            }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let addQuestionVC = segue.destination as? AddQuestionViewController {
                addQuestionVC.delegate = self
            }
        }
        
        // Implement the delegate method
    func addNewQuestion(question: String, options: [String], correctAnswer: Int) {
        let newQuestion = QuizQuestion(question: question, choices: options, correctAnswer: correctAnswer)
        sampleQuestions.append(newQuestion)
        
        // Save updated questions to UserDefaults
        saveQuestionsToUserDefaults()
        
        // Update the questions array used in the quiz
        questions = Array(sampleQuestions.prefix(10))
        
        // Display the updated set of questions
        displayQuestion()
    }


    func saveQuestionsToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(sampleQuestions) {
            UserDefaults.standard.set(encoded, forKey: "savedQuestions")
        }
    }

    }
