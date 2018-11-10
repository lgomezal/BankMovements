//
//  Movements.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

public protocol MovementsProtocol {
    func count() -> Int
    func add(operation: Transaction)
    func get(index: Int) -> Transaction
}

public class Movements: MovementsProtocol {
    
    private var movementsList: [Transaction]?
    
    public init() {
        self.movementsList = []
    }
    
    public func count() -> Int {
        return (movementsList?.count) ?? 0
    }
    
    public func add(operation: Transaction) {
        movementsList?.append(operation)
    }
    
    public func get(index: Int) -> Transaction {
        return (movementsList![index])
    }
}
