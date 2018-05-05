//
//  TransactionDetailViewController.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 05/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import UIKit
import FontAwesome_swift

class IncomingTransactionDetailViewController: UIViewController {

    var transaction: Transaction? = nil
    
    @IBOutlet private weak var icon: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    @IBOutlet private weak var accountNumberLabel: UILabel!
    @IBOutlet private weak var accountNameLabel: UILabel!
    @IBOutlet private weak var bankCodeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        icon.font = UIFont.fontAwesome(ofSize: icon.font.pointSize)
        icon.text = String.fontAwesomeIcon(name: .arrowCircleRight)
        
        let sv = UIView.displaySpinner(onView: self.view)
        
        if let transaction = self.transaction {
            amountLabel.text = "\(transaction.amount) Kč"
            
            let _ = TransactionManager.shared.getTransactionDetails(id: transaction.id).subscribe(onNext: { (account) in
                self.accountNameLabel.text = account.name
                self.accountNumberLabel.text = "\(account.number)"
                self.bankCodeLabel.text = "\(account.bank)"
                
                UIView.removeSpinner(spinner: sv)
            }, onError: { (error) in
                let alert = UIAlertController(title: "Error loading transaction", message: "Error loading transaction. Are you connected to the internet? Try reloading the data.", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                    UIView.removeSpinner(spinner: sv)
                    self.navigationController?.popViewController(animated: true)
                }))
                self.present(alert, animated: true, completion: nil)
            }, onCompleted: nil, onDisposed: nil)
        }
    }
}
