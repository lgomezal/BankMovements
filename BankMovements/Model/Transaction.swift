//
//  Operation.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

public class Transaction {
    var id: Int
    var date: Date
    var amount: Double
    var fee: Double? = nil
    var description: String? = ""
    
    public init(id: Int, date: Date, amount: Double) {
        self.id = id
        self.date = date
        self.amount = amount
    }
}
