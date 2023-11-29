//
//  AddQuestionViewController.swift
//  QuizGame
//
//  Created by Smera on 2023-11-28.
//

// AddQuestionViewController.swift

import UIKit

class AddQuestionViewController: UIViewController  {
  
    
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var option1TextField: UITextField!
    @IBOutlet weak var option2TextField: UITextField!
    @IBOutlet weak var option3TextField: UITextField!
    @IBOutlet weak var option4TextField: UITextField!
    @IBOutlet weak var correctAnswerSegmentedControl: UISegmentedControl!
    weak var delegate: AddQuestionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Additional setup if needed
    }
    
    @IBAction func saveQuestion(_ sender: UIButton) {
        // Fetch user inputs
        let question = questionTextField.text ?? ""
        let option1 = option1TextField.text ?? ""
        let option2 = option2TextField.text ?? ""
        let option3 = option3TextField.text ?? ""
        let option4 = option4TextField.text ?? ""
        let correctAnswerIndex = correctAnswerSegmentedControl.selectedSegmentIndex
        
        // Handle saving the question, options, and correct answer
        let options = [option1, option2, option3, option4]
        let correctAnswer = options[correctAnswerIndex]
        
        // Example: You might save this data to a database or a file
        saveQuestionToDatabase(question: question, options: options, correctAnswer: correctAnswer)
        
        
        // Notify delegate with the new question data
        delegate?.addNewQuestion(question: question, options: options, correctAnswer: correctAnswerIndex)
        
        // Dismiss the view controller after saving
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    // Function to save question details to a database (replace this with actual data handling logic)
    func saveQuestionToDatabase(question: String, options: [String], correctAnswer: String) {
        // Example: Perform the necessary logic to save the question data
        // This could involve interacting with a database or storing locally
        
        // For demonstration purposes, print the question details
        print("Question: \(question)")
        print("Options: \(options)")
        print("Correct Answer: \(correctAnswer)")
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        // Dismiss the view controller if the user cancels
        dismiss(animated: true, completion: nil)
    }
}
