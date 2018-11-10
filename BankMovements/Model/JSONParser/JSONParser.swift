//
//  JSONParser.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

func parseMovements(data: Data) -> Movements {
    let movements = Movements()
    var arrayTransactions: [Transaction] = []
    
    do {
        //Create custom decoder to treat the date field that may be invalid
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let dateISO8601 = DateFormatter()
            dateISO8601.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            var tmpDate: Date? = nil
            tmpDate = dateISO8601.date(from: dateStr)
            
            guard let date = tmpDate else {
                let dateInit = Date.init(timeIntervalSince1970: 86399)
                return dateInit
            }
            return date
        })
        let transactionsCodable = try decoder.decode(Array<TransactionCodable>.self, from: data)
        //Filter transactions from JSON with requirements
        //Map TransactionCodable to Transaction class
        for transaction in transactionsCodable {
            if let transaction = mapTransactionCodableIntoTransaction(transactionCodable: transaction) {
                arrayTransactions.append(transaction)
            }
        }
        //Order array with transactions for id and date
        arrayTransactions.sort(by: {(obj1, obj2) -> Bool in
            return (obj1.id, obj1.date) > (obj2.id, obj2.date)
        })
        //Eliminate reg with id duplicated and save most recent date
        var idPrev = 0
        var arrayFiltered: [Transaction] = []
        for transaction in arrayTransactions {
            if transaction.id == idPrev {
                continue
            } else {
                arrayFiltered.append(transaction)
                idPrev = transaction.id
            }
        }
        //Order transactions for most recent date
        arrayFiltered.sort(by: {(obj1, obj2) -> Bool in
            return (obj1.date) > (obj2.date)
        })
        //save final result in Movements class
        for transaction in arrayFiltered {
            movements.add(transaction: transaction)
        }
        
    } catch let parsingError {
        activityIndicator.removeFromSuperview()
        print(parsingError)
    }
    return movements
}
