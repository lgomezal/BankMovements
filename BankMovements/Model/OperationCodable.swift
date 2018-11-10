//
//  OperationCodable.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

struct OperationCodable: Codable {
    
    let id: Int
    let date: Date?
    let amount: Double
    let fee: Double?
    let description: String?
    
    init(id: Int, date: Date?, amount: Double, fee: Double?, description: String?) {
        self.id = id
        self.date = date
        self.amount = amount
        self.fee = fee
        self.description = description
    }
}
