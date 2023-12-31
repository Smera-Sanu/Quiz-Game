
//  PlayViewController.swift
//  QuizGame
//
//  Created by Smera on 2023-10-22.
//
import UIKit

class CategoryViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var categoryLabel: UILabel!
    //weak var viewController: ViewController?
    
    public var selectedCategory: String?
    var allCategories = ["Geography", "Entertainment", "Science", "History", "Sports", "Nature"]
    var filteredCategories: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
        filteredCategories = allCategories
        tableView.reloadData()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            filteredCategories = allCategories
        } else {
            filteredCategories = allCategories.filter { category in
                return category.lowercased().contains(searchText.lowercased())
            }
        }
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCategories.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SuggestionCell", for: indexPath) as! CategoryTableViewCell
        cell.configureCell(category: filteredCategories[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedCategory = filteredCategories[indexPath.row]
            print("Inside category")
            print(selectedCategory!)
            
            // Notify the ViewController about the selected category
            performSegue(withIdentifier: "backToMainSegue", sender: self)
        }
    
    
//    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        selectedCategory = filteredCategories[indexPath.row]
//
//        // Notify the McqViewController about the selected category
//        NotificationCenter.default.post(name: NSNotification.Name("CategorySelected"), object: selectedCategory)
//        
//        // Dismiss the CategoryViewController if needed
//        dismiss(animated: true, completion: nil)
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "backToMainSegue" {
                if let viewController = segue.destination as? ViewController {
                    viewController.selectedCategory = selectedCategory
                }
            }
        }
    
    
    
        
        @IBAction func backButtonPressed(_ sender: UIButton) {
            self.performSegue(withIdentifier: "backToMainSegue", sender: self)
        }
    }

