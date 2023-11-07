//
//  CategoryTableViewCell.swift
//  QuizGame
//
//  Created by Smera on 2023-10-23.
//
import Foundation
import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryIcon: UIImageView!

    func configureCell(category: String) {
        // Customize the cell based on the category
        categoryLabel.text = category

        // Set different colors and icons based on the category
        switch category {
        case "Geography":
            //categoryLabel.textColor = UIColor.systemBlue
            categoryLabel.textColor = UIColor.white
            categoryIcon.image = UIImage(systemName: "globe")
            categoryIcon.tintColor = UIColor.black
        case "Entertainment":
//            categoryLabel.textColor = UIColor.systemOrange
            categoryLabel.textColor = UIColor.white
            categoryIcon.image = UIImage(systemName: "tv")
            categoryIcon.tintColor = UIColor.black
        case "Science":
//            categoryLabel.textColor = UIColor.systemTeal
            categoryLabel.textColor = UIColor.white
            categoryIcon.image = UIImage(systemName: "flask")
            categoryIcon.tintColor = UIColor.black
        case "History":
//            categoryLabel.textColor = UIColor.systemPurple
            categoryLabel.textColor = UIColor.white
            categoryIcon.image = UIImage(systemName: "book")
            categoryIcon.tintColor = UIColor.black
        case "Sports":
//            categoryLabel.textColor = UIColor.systemRed
            categoryLabel.textColor = UIColor.white
            categoryIcon.image = UIImage(systemName: "sportscourt")
            categoryIcon.tintColor = UIColor.black
        case "Nature":
//            categoryLabel.textColor = UIColor.systemGreen
            categoryLabel.textColor = UIColor.white
            categoryIcon.image = UIImage(systemName: "leaf")
            categoryIcon.tintColor = UIColor.black
        default:
            break
        }
    }
}
