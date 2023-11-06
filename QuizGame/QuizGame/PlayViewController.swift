//
//  PlayViewController.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-22.
//

import UIKit

class PlayViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    var question: String?
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowQuestionWithAnswer" {
            if let destinationVC = segue.destination as? PlayViewController, let questionText = sender as? String {
                destinationVC.question = questionText
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let questionText = question {
               questionLabel.text = questionText
           }  // Do any additional setup after loading the view.
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
