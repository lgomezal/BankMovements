//
//  MapTransactions.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

func mapTransactionCodableIntoTransaction(transactionCodable: TransactionCodable) -> Transaction? {
    if transactionCodable.date != Date(timeIntervalSince1970: 86399) {
        let transaction = Transaction(id: transactionCodable.id, date: transactionCodable.date!, amount: transactionCodable.amount)
        transaction.fee = transactionCodable.fee ?? 0
        transaction.description = transactionCodable.description ?? ""
        
        return transaction
    }
    return nil
}
