//
//  ResidentController.swift
//  DefaultsAndHiddenButtons
//
//  Created by Lambda_School_Loaner_259 on 3/10/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

class ResidentController {
    
    // MARK: - Properties
    var residents: [Resident] = []
    static var residentController = ResidentController()
    
    // MARK: - CRUD
    func createResident(name: String, roomNumber: Int, medication: Medication? = nil) {
        var newResident: Resident
        if let medication = medication {
            newResident = Resident(name: name, roomNumber: roomNumber, medications: [medication])
        } else {
            newResident = Resident(name: name, roomNumber: roomNumber, medications: [])
        }
        residents.append(newResident)
        saveToPersistentStore()
    }
    
    func residentNamed(name: String) -> Int? {
        for i in 0..<residents.count {
            if residents[i].name == name {
                return i
            }
        }
        return nil
    }
    
    func deleteResident(name: String) {
        guard let index = residentNamed(name: name) else { return }
        residents.remove(at: index)
        saveToPersistentStore()
    }
    
    
    // MARK: - Persistence
    private var persistentFileURL: URL? {
        let fileManager = FileManager.default
        guard let documents = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first else { return nil }
        
        return documents.appendingPathComponent("residents.plist")
    }
    
    func saveToPersistentStore() {
        guard let url = persistentFileURL else { return }
        
        do {
            let encoder = PropertyListEncoder()
            let data = try encoder.encode(residents)
            try data.write(to: url)
        } catch {
            print("Error saving resident data: \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        
        let fileManager = FileManager.default
        guard let url = persistentFileURL, fileManager.fileExists(atPath: url.path) else {
            return }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            residents = try decoder.decode([Resident].self, from: data)
        } catch {
            print("error loading resident data: \(error)")
        }
    }
}
