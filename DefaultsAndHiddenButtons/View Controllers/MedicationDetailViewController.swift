//
//  MedicationDetailViewController.swift
//  DefaultsAndHiddenButtons
//
//  Created by Lambda_School_Loaner_259 on 3/10/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class MedicationDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - IBOutlets
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dosageTextField: UITextField!
    @IBOutlet var howOftenTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
