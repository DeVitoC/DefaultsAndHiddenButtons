//
//  MedicationTableViewCell.swift
//  DefaultsAndHiddenButtons
//
//  Created by Lambda_School_Loaner_259 on 3/10/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class MedicationTableViewCell: UITableViewCell {

    // MARK: - Properties
    var medication: Medication? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet var medicationLabel: UILabel!
    @IBOutlet var medicationGivenButton: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func medicationGivenButtonTapped(_ sender: Any) {
    }
    
    
    func updateViews() {
        medicationLabel.text = medication?.name
        
    }
}
