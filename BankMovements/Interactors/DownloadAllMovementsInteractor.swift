//
//  DownloadAllMovementsInteractor.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol DownloadAllMovementsInteractor {
    // execute: downloads all movements. Return on the main thread.
    func execute(onSuccess: @escaping(Movements) -> Void, onError: errorClosure)
}
