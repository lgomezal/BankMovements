//
//  DownloadAllMovementsInteractorAlamofireImpl.swift
//  BankMovements
//
//  Created by luis gomez alonso on 11/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation
import Alamofire

class DownloadAllMovementsInteractorAlamofireImpl: DownloadAllMovementsInteractor {
    
    func execute(onSuccess: @escaping (Movements) -> Void, onError: errorClosure) {
        
        Alamofire.request(Constants.urlString).responseData { (response) in
            guard response.result.isSuccess else {
                if let myError = onError {
                    myError(response.result.error!)
                }
                return
            }
            let data = response.result.value
            
            OperationQueue.main.addOperation {
                assert(Thread.current == Thread.main)
                // OK
                let movements = parseMovements(data: data!)
                //return Movements
                onSuccess(movements)
            }
        }
    }
}
