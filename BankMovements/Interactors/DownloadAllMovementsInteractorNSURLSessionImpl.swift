//
//  DownloadAllMovementsInteractorNSURLSessionImpl.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

class DownloadAllMovementsInteractorNSURLSessionImpl: DownloadAllMovementsInteractor {
    
    func execute(onSuccess: @escaping (Movements) -> Void, onError: errorClosure) {
        
        let urlString = Constants.urlString
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    if error == nil {
                        // OK
                        let movements = parseMovements(data: data!)
                        //return Movements
                        onSuccess(movements)
                    } else {
                        // ERROR
                        if let myError = onError {
                            myError(error!)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}

