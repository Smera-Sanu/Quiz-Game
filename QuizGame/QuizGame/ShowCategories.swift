//
//  ShowCategories.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-23.
//

import Foundation
import UIKit

class ShowCategories: UIViewController {
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var button4: UIButton!
    var selectedCategory: String? // Property to store the selected category

    @IBAction func categoryButtonTapped(_ sender: UIButton) {
        if let categoryTitle = sender.currentTitle {
            selectedCategory = categoryTitle
            performSegue(withIdentifier: "UnwindToMainWithCategory", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
       button1.setTitle("Category 1", for: .normal)
                button2.setTitle("Category 2", for: .normal)
                button3.setTitle("Category 3", for: .normal)
                button4.setTitle("Category 4", for: .normal)
                
       
    }
}
