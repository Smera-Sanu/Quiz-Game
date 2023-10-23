//
//  ViewController.swift
//  QuizGame
//
//  Created by Smera on 2023-10-01.
//
import UIKit

class ViewController: UIViewController {
<<<<<<< Updated upstream
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
=======
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var categoriesButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
    }
    
    var selectedCategory: String? = nil

       @IBAction func unwindFromShowCategories(_ unwindSegue: UIStoryboardSegue) {
           if let sourceViewController = unwindSegue.source as? ShowCategories {
               selectedCategory = sourceViewController.selectedCategory
               if let selectedCategory = selectedCategory {
                   showAlert(category: selectedCategory)
               }
           }
       }

       func showAlert(category: String) {
           let alert = UIAlertController(title: "Selected Category", message: "You selected: \(category)", preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
    
    
    @IBAction func playClicked(_ sender: UIButton) {
       
                let alert = UIAlertController(title: "Choose Game Type", message: "Select the game type", preferredStyle: .alert)
                
                // Add "Type" action
                alert.addAction(UIAlertAction(title: "Type", style: .default) { [weak self] _ in
                    self?.performSegue(withIdentifier: "PlayPress", sender: self)
                })
                
                // Add "MCQ" action
                alert.addAction(UIAlertAction(title: "MCQ", style: .default) { [weak self] _ in
                    self?.performSegue(withIdentifier: "Mcq", sender: self)
                })
                
                
                present(alert, animated: true, completion: nil)
    }
    @IBAction func categoriesClicked(_ sender: UIButton) {
        
        performSegue(withIdentifier: "ShowCategories", sender: self)
    }
    
    
    func configureButton(){
        playButton.layer.cornerRadius = 10
                playButton.clipsToBounds = true

                categoriesButton.layer.cornerRadius = 10
                categoriesButton.clipsToBounds = true

                 
                playButton.layer.shadowColor = UIColor.black.cgColor
                playButton.layer.shadowOpacity = 0.2
                playButton.layer.shadowOffset = CGSize(width: 0, height: 4)
                playButton.layer.shadowRadius = 3

                categoriesButton.layer.shadowColor = UIColor.black.cgColor
                categoriesButton.layer.shadowOpacity = 0.2
                categoriesButton.layer.shadowOffset = CGSize(width: 0, height: 4)
                categoriesButton.layer.shadowRadius = 3
>>>>>>> Stashed changes
    }
    
    @IBAction func categoriesClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: self)
    }
    
    @IBAction func playClicked(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Choose Game Type", message: "Select the game type", preferredStyle: .alert)
        
//        // Add "Type" action
        alert.addAction(UIAlertAction(title: "Type", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "Type", sender: self)
        })
        
        // Add "MCQ" action
        alert.addAction(UIAlertAction(title: "MCQ", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "Mcq", sender: self)
        })
        
        
        present(alert, animated: true, completion: nil)
    }
    
}
