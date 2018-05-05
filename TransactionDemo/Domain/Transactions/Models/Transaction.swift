//
//  Transaction.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 05/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

class Transaction {
    
    let type: TransactionType
    let id: Int
    let amount: Double
    
    private init(id: Int, amount: Double, type: TransactionType) {
        self.type = type
        self.id = id
        self.amount = amount
    }
    
    static func createIncoming(id: Int, amount: Double) -> Transaction {
        return Transaction(id: id, amount: amount, type: TransactionType.incoming)
    }
    
    static func createOutgoing(id: Int, amount: Double) -> Transaction {
        return Transaction(id: id, amount: amount, type: TransactionType.outgoing)
    }
}
