//
//  ViewController.swift
//  QuizGame
//
//  Created by Smera on 2023-10-01.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnPlay: UIButton!
    
    @IBOutlet weak var btnLevels: UIButton!
    @IBOutlet weak var btnCategories: UIButton!
    @IBOutlet weak var selectedCategoryLabel: UILabel!
    var selectedCategory: String?
   // weak var categoryViewController: CategoryViewController?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // if segue.identifier == "backToMainSegue" {
           if segue.identifier == "backToMainSegue" {
                if let categoryViewController = segue.source as? CategoryViewController {
                    selectedCategory = categoryViewController.selectedCategory
                    selectedCategoryLabel.text = "Selected Category: \(selectedCategory ?? "No category selected")"
                    print("Inside Main")
                    print(selectedCategory ?? "No category selected")
                }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func categoriesClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: self)
    }
    
    
}
