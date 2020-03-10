//
//  RedsidentsTableViewController.swift
//  DefaultsAndHiddenButtons
//
//  Created by Lambda_School_Loaner_259 on 3/10/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

class RedsidentsTableViewController: UITableViewController {
    
    // MARK: - Properties
    var residentController = ResidentController.residentController

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let residents = residentController.residents
        return residents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ResidentCell", for: indexPath)
        let residents = residentController.residents
        let resident = residents[indexPath.row]
        guard let medications = resident.medications else { return UITableViewCell() }
        cell.textLabel?.text = resident.name
        cell.detailTextLabel?.text = "\(medications.count)"
        return cell
    }


//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MedicationTableViewSegue" {
            guard let medicationsTVC = segue.destination as? MedicationsTableViewController, let index = tableView.indexPathForSelectedRow else { return }
            let resident = residentController.residents[index.row]
            medicationsTVC.resident = resident
        }
    }

}
