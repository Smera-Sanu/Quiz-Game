//
//  AddQuestionViewController.swift
//  QuizGame
//
//  Created by Smera on 2023-11-28.
//

// AddQuestionViewController.swift

import UIKit

class AddQuestionViewController: UIViewController,UITextFieldDelegate  {
  
    
    
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var option1TextField: UITextField!
    @IBOutlet weak var option2TextField: UITextField!
    @IBOutlet weak var option3TextField: UITextField!
    @IBOutlet weak var option4TextField: UITextField!
    @IBOutlet weak var correctAnswerSegmentedControl: UISegmentedControl!
    weak var delegate: AddQuestionDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the delegate for each text field
                questionTextField.delegate = self
                option1TextField.delegate = self
                option2TextField.delegate = self
                option3TextField.delegate = self
                option4TextField.delegate = self
        // Additional setup if needed
    }
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
           updateSegmentedControl()
       }
    
    
    
  
    
    // Function to update the segmented control with text field values
    func updateSegmentedControl() {
        let option1 = option1TextField.text ?? ""
        let option2 = option2TextField.text ?? ""
        let option3 = option3TextField.text ?? ""
        let option4 = option4TextField.text ?? ""

        let options = [option1, option2, option3, option4]

        // Clear existing segments
        correctAnswerSegmentedControl.removeAllSegments()

        // Add new segments
        for (index, option) in options.enumerated() {
            correctAnswerSegmentedControl.insertSegment(withTitle: option, at: index, animated: false)
        }
    }

    
    
    
//        func updateSegmentedControl() {
//            let option1 = option1TextField.text ?? ""
//            let option2 = option2TextField.text ?? ""
//            let option3 = option3TextField.text ?? ""
//            let option4 = option4TextField.text ?? ""
//
//            let options = [option1, option2, option3, option4]
//
//            // Set the titles of the segmented control
//            correctAnswerSegmentedControl.removeAllSegments()
////            for (index, option) in options.enumerated() {
////                correctAnswerSegmentedControl.insertSegment(withTitle: option, at: index, animated: false)
////            }
//            
//            correctAnswerSegmentedControl.setTitle(option1, forSegmentAt: 0)
//                   correctAnswerSegmentedControl.setTitle(option2, forSegmentAt: 1)
//                   correctAnswerSegmentedControl.setTitle(option3, forSegmentAt: 2)
//                   correctAnswerSegmentedControl.setTitle(option4, forSegmentAt: 3)
//              
//        }
    
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
