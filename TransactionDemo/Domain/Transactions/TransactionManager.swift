//
//  TransactionManager.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 05/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import RxSwift

class TransactionManager: TransactionManagerP {
    
    static let shared = TransactionManager()
    
    private init() {}
    
    func getAllTransactions() -> Observable<Transaction> {
        return TransactionAPI.shared.getAllTransactions().map({ transactions -> Transaction in
            if(transactions["direction"].string == "OUTGOING") {
                return Transaction.createOutgoing(id: transactions["id"].int!, amount: transactions["amountInAccountCurrency"].double!)
            } else {
                return Transaction.createIncoming(id: transactions["id"].int!, amount: transactions["amountInAccountCurrency"].double!)
            }
        })
    }
    
    func getTransactionDetails(id: Int) -> Observable<Account> {
        return TransactionAPI.shared.getTransactionDetail(id: id).map({ (account) -> Account in
            print(account)
            
            return Account(number: Int(account["accountNumber"].string!)!, name: account["accountName"].string!, bank: Int(account["bankCode"].string!)!)
        })
    }
    
}
