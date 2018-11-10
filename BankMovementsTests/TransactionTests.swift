//
//  TransactionTests.swift
//  BankMovementsTests
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import XCTest
@testable import BankMovements

class TransactionTests: XCTestCase {
    
    var transaction: Transaction!
    var movements = Movements()
    
    override func setUp() {
        super.setUp()
        transaction = Transaction(id: 1, date: Date(), amount: 100.00)
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMovementExistence() {
        XCTAssertNotNil(transaction)
    }
    
    func testAddTransaction() {
        
        XCTAssertEqual(movements.count(), 0)
        movements.add(operation: transaction)
        
        XCTAssertEqual(movements.count(), 1)
        movements.add(operation: transaction)
        
        XCTAssertEqual(movements.count(), 2)
        
        let transaction2 = Transaction(id: 2, date: Date(), amount: 100.00)
        movements.add(operation: transaction2)
        XCTAssertEqual(movements.count(), 3)
        
    }
}
