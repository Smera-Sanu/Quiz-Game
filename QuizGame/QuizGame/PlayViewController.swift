//
//  PlayViewController.swift
//  QuizGame
//
<<<<<<< Updated upstream
//  Created by Smera on 2023-10-23.
=======
//  Created by Lipson Shiji on 2023-10-22.
>>>>>>> Stashed changes
//

import UIKit

class PlayViewController: UIViewController {
<<<<<<< Updated upstream
    var selectedCategory: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
=======
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
>>>>>>> Stashed changes
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
