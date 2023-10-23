//
//  RadioButton.swift
//  QuizGame
//
//  Created by Lipson Shiji on 2023-10-23.
//

import Foundation
import UIKit

class RadioButton: UIButton {
<<<<<<< Updated upstream
    
=======
    // Boolean property to indicate whether the button is selected or not.
>>>>>>> Stashed changes
    override var isSelected: Bool {
        get {
            return super.isSelected
        }
        set {
            super.isSelected = newValue
<<<<<<< Updated upstream
            
=======
            // Update the button's image based on the selection state.
>>>>>>> Stashed changes
            setImage(isSelected ? UIImage(named: "radio_selected") : UIImage(named: "radio_unselected"), for: .normal)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
<<<<<<< Updated upstream
        setImage(UIImage(named: "radio_unselected"), for: .normal)
       setImage(UIImage(named: "radio_selected"), for: .selected)
=======
        // Set image for the unselected state.
        setImage(UIImage(named: "radio_unselected"), for: .normal)
        // Set image for the selected state.
        setImage(UIImage(named: "radio_selected"), for: .selected)
        // Handle touch events to toggle the selection.
>>>>>>> Stashed changes
        addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc private func buttonTapped() {
        isSelected.toggle()
    }
}
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
