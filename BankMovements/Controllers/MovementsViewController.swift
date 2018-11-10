//
//  MovementsViewController.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class MovementsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var movementCollectionView: UICollectionView!
    
    @IBOutlet weak var totalAccount: UILabel!
    
    let movementCollectionViewCellId = "TransactionCollectionViewCell"
    
    var movements: Movements?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set title
        title = Constants.movementsTitle
        
        //Configure navigation text color
        self.navigationController?.navigationBar.tintColor = CustomColors.orangeColor
        
        //Calculate total account
        let total = self.calculateTotalAccount()
        totalAccount.text = String(total)
        
        //Ajust width constraints
        self.movementCollectionView.widthAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.width) - 10).isActive = true
        
        //register cell
        let nibCell = UINib(nibName: movementCollectionViewCellId, bundle: nil)
        movementCollectionView.register(nibCell, forCellWithReuseIdentifier: "TransactionCell")
        
        self.movementCollectionView.delegate = self
        self.movementCollectionView.dataSource = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let movements = self.movements {
            return movements.count()
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TransactionCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TransactionCell", for: indexPath) as! TransactionCollectionViewCell
        
        let transaction: Transaction = (self.movements?.get(index: indexPath.row))!
        
        cell.refresh(transaction: transaction)
        
        return cell
    }
    
    func calculateTotalAccount() -> Double {
        var totalAcoount: Double = 0
        if let numberTransactions = movements?.count() {
            for i in 0..<numberTransactions {
                let transaction = movements?.get(index: i)
                let total = Double((transaction?.amount)!) + Double((transaction?.fee)!)
                totalAcoount = totalAcoount + total
            }
            
        }
        return totalAcoount
    }
    
}
