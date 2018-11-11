//
//  InitialViewController.swift
//  BankMovements
//
//  Created by luis gomez alonso on 10/11/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

let activityIndicator = UIActivityIndicatorView(style: .gray)

class InitialViewController: UIViewController {
    
    @IBOutlet weak var urlSessionButton: UIButton!
    
    @IBOutlet weak var alamofireButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add title
        title = Constants.initialTitle
        
        //Configure text color for buttons
        urlSessionButton.setTitleColor(CustomColors.orangeColor, for: .normal)
        alamofireButton.setTitleColor(CustomColors.orangeColor, for: .normal)
        
    }
    
    @IBAction func urlSessionButtonPress(_ sender: UIButton) {
        downloadMovementsWithURLSession()
    }
    
    @IBAction func alamofireButtonPress(_ sender: UIButton) {
        downloadMovementsWithAlamofire()
    }
    
    func downloadMovementsWithURLSession() {
        //Configure activity indicator
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
        let downloadMovementsInteractor: DownloadAllMovementsInteractor = DownloadAllMovementsInteractorNSURLSessionImpl()
        
        downloadMovementsInteractor.execute(onSuccess: { (movements: Movements) in
            //OK
            activityIndicator.removeFromSuperview()
            let movementsViewController = MovementsViewController()
            movementsViewController.movements = movements
            self.navigationController?.pushViewController(movementsViewController, animated: true)
        }) { (error) in
            activityIndicator.removeFromSuperview()
            let alert = Alerts().alert(title: "ERROR", message: Constants.errorParsing)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func downloadMovementsWithAlamofire() {
        //Configure activity indicator
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.startAnimating()
        let downloadMovementsInteractor: DownloadAllMovementsInteractor = DownloadAllMovementsInteractorAlamofireImpl()
        
        downloadMovementsInteractor.execute(onSuccess: { (movements: Movements) in
            //OK
            activityIndicator.removeFromSuperview()
            let movementsViewController = MovementsViewController()
            movementsViewController.movements = movements
            self.navigationController?.pushViewController(movementsViewController, animated: true)
        }) { (error) in
            activityIndicator.removeFromSuperview()
            let alert = Alerts().alert(title: "ERROR", message: Constants.errorParsing)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
