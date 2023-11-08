//JUJUBEEE
//  ViewController.swift
//  QuizGame
//
//  Created by Smera on 2023-10-01.
//
import UIKit

class ViewController: UIViewController {
    
   
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var selectedCat: UILabel!
    @IBOutlet weak var categoriesButton: UIButton!
    var selectedCategory: String? = nil
    @IBOutlet weak var levelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButton()
        if let selectedCategory = selectedCategory {
                        selectedCat.text = " \(selectedCategory)"
                    }

        
        NotificationCenter.default.addObserver(self, selector: #selector(categorySelected(_:)), name: NSNotification.Name("CategorySelected"), object: nil)
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "categorySegue" {
//            if let mcqVC = segue.destination as? McqViewController {
//                mcqVC.selectedCategory = selectedCategory // Pass the selected category
//            }
//        }
//    }

    @objc func categorySelected(_ notification: Notification) {
        if let category = notification.object as? String {
            selectedCategory = category
            print("Selected categoryLip: \(selectedCategory ?? "No category")")
        }
    }

    @IBAction func playClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Game Type", message: "Select the game type", preferredStyle: .alert)

        // Add "Type" action
        alert.addAction(UIAlertAction(title: "Type", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "Type", sender: self)
        })

        // Add "MCQ" action
        alert.addAction(UIAlertAction(title: "MCQ", style: .default) { [weak self] _ in
            self?.performSegue(withIdentifier: "Mcq", sender: self)
        })

        present(alert, animated: true, completion: nil)
    }

    @IBAction func levelButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "Choose Difficulty Level", message: "Select the difficulty level", preferredStyle: .alert)

           // Add "Easy" action
           alert.addAction(UIAlertAction(title: "Easy", style: .default, handler: { [weak self] _ in
               // Handle the selection of the Easy difficulty level here
               // You can store the selected difficulty level and use it as needed
           }))

           // Add "Medium" action
           alert.addAction(UIAlertAction(title: "Medium", style: .default, handler: { [weak self] _ in
               // Handle the selection of the Medium difficulty level here
           }))

           // Add "Hard" action
           alert.addAction(UIAlertAction(title: "Hard", style: .default, handler: { [weak self] _ in
               // Handle the selection of the Hard difficulty level here
           }))

           // Add "Cancel" action
           alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

           present(alert, animated: true, completion: nil)
        
        
    }
    @IBAction func categoriesClicked(_ sender: UIButton) {
        performSegue(withIdentifier: "categorySegue", sender: self)
    }

    func configureButton() {
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
    }
}
