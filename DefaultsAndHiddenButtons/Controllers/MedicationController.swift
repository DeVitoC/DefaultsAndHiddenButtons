//
//  MedicationController.swift
//  DefaultsAndHiddenButtons
//
//  Created by Lambda_School_Loaner_259 on 3/10/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

class MedicationController {
    
    // MARK: - Properties
    var medications: [Medication] = []
    var residentController = ResidentController.residentController
    
    
    // MARK: - CRUD
    func createMedication(residentName: String, name: String, takeMedication: Int) {
        let newMedication = Medication(name: name, takeInterval: takeMedication)
        guard let residentIndex = residentController.residentNamed(name: residentName) else { return }
        residentController.residents[residentIndex].medications?.append(newMedication)
        residentController.saveToPersistentStore()
    }
    
    func medicationNamed(medicationName: String, residentName: String) -> Int? {
        guard let residentIndex = residentController.residentNamed(name: residentName) else { return nil}
        let resident = residentController.residents[residentIndex]
        guard let medications = resident.medications else { return nil }
        for i in 0..<medications.count {
            if medications[i].name == medicationName {
                return i
            }
        }
        return nil
    }
    
    func deleteMedication(medicationName: String, residentName: String) {
        guard let medicationIndex = medicationNamed(medicationName: medicationName, residentName: residentName), let residentIndex = residentController.residentNamed(name: residentName) else { return }
        residentController.residents[residentIndex].medications?.remove(at: medicationIndex)
        residentController.saveToPersistentStore()
    }
}
