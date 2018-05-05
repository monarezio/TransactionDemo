//
//  TransactionManagerP.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 05/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import RxSwift

protocol TransactionManagerP {
    
    func getAllTransactions() -> Observable<Transaction>
    
    func getTransactionDetails(id: Int) -> Observable<Account>
    
}
