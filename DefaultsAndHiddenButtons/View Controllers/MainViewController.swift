//
//  MainViewController.swift
//  DefaultsAndHiddenButtons
//
//  Created by Lambda_School_Loaner_259 on 3/10/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - Properties
    let residentController = ResidentController.residentController
    
    var residents: [Resident] = [] {
        didSet {
            //filterResidents()
        }
    }
    
    var residentTableViewController: RedsidentsTableViewController? {
        didSet {
            residentTableViewController?.residents = residents
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet var searchTextField: UITextField!
    
    
    // MARK: - IBActions
    @IBAction func searchTextFieldEdited(_ sender: Any) {
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MedicationTableViewSegue" {
            guard let residentTableVC = segue.destination as? RedsidentsTableViewController else { return }
            residentTableViewController = residentTableVC
        }
    }


}
