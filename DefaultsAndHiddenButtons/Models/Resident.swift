//
//  Resident.swift
//  DefaultsAndHiddenButtons
//
//  Created by Lambda_School_Loaner_259 on 3/10/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import Foundation

struct Resident: Codable {
    var name: String
    var roomNumber: Int
    var medications: [Medication]?
}
