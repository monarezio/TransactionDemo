//
//  OutgoingTabelViewCell.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 05/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import UIKit

class OutgoingTabelViewCell: UITableViewCell {

    @IBOutlet private weak var outgoingIcon: UILabel!
    @IBOutlet private weak var amount: UILabel!
    @IBOutlet private weak var icon: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        outgoingIcon.font = UIFont.fontAwesome(ofSize: outgoingIcon.font.pointSize)
        outgoingIcon.text = String.fontAwesomeIcon(name: .arrowCircleLeft)
        
        icon.font = UIFont.fontAwesome(ofSize: icon.font.pointSize)
        icon.text = String.fontAwesomeIcon(name: .angleRight)
    }
    
    func setAmount(amount: Double) {
        self.amount.text = "\(amount) Kč"
    }
}
