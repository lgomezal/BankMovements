//
//  TransactionCollectionViewCell.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class TransactionCollectionViewCell: UICollectionViewCell {
    var transaction: Transaction?
    
    @IBOutlet weak var transactionCell: UIView!
    @IBOutlet weak var dateCell: UILabel!
    @IBOutlet weak var amountCell: UILabel!
    @IBOutlet weak var feeCell: UILabel!
    @IBOutlet weak var totalCell: UILabel!
    @IBOutlet weak var descriptionCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Initialization code
        transactionCell.layer.cornerRadius = 10
        transactionCell.clipsToBounds = true
        transactionCell.layer.borderWidth = 3
        transactionCell.layer.borderColor = CustomColors.orangeColorAlpha.cgColor
        //Ajust width constraints
        self.transactionCell.widthAnchor.constraint(equalToConstant:  (UIScreen.main.bounds.width) - 10).isActive = true
    }
    
    func refresh(transaction: Transaction) {
        self.transaction = transaction
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        self.dateCell.text = formatter.string(from: transaction.date)
        self.amountCell.text = String(transaction.amount)
        if transaction.amount < 0 {
            self.amountCell.textColor = .red
        } else {
            self.amountCell.textColor = CustomColors.greenColor
        }
        if let fee = transaction.fee {
            self.feeCell.text = String(transaction.fee!)
            if transaction.fee! < 0 {
                self.feeCell.textColor = .red
            }
            let total = transaction.amount + fee
            self.totalCell.text = String(total)
            if total < 0 {
                self.totalCell.textColor = .red
            } else {
                self.totalCell.textColor = CustomColors.greenColor
            }
        } else {
            self.feeCell.text = String(0)
            let total = transaction.amount + 0
            self.totalCell.text = String(total)
        }
        if transaction.description == "" {
            self.descriptionCell.text = "Sin descripción"
        } else {
            self.descriptionCell.text = transaction.description
        }
        
    }
    
}

