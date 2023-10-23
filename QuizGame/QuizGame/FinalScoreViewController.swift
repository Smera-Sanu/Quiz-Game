//
//  FinalScoreViewController.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-23.
//

import Foundation
import UIKit

class FinalScoreViewController: UIViewController {
    @IBOutlet weak var finalScoreLabel: UILabel!
    
    var finalScore = 0 // This variable will be set when navigating to this view controller.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        finalScoreLabel.text = "Final Score: \(finalScore)"
    }
}
