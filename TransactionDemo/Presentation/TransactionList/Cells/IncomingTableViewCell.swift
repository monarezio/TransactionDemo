//
//  TransactionTableViewCell.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 05/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import UIKit
import FontAwesome_swift

class IncomingTableViewCell: UITableViewCell {

    @IBOutlet private weak var incomingIcon: UILabel!
    @IBOutlet private weak var icon: UILabel!
    @IBOutlet private weak var amount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        incomingIcon.font = UIFont.fontAwesome(ofSize: incomingIcon.font.pointSize)
        incomingIcon.text = String.fontAwesomeIcon(name: .arrowCircleRight)
        
        icon.font = UIFont.fontAwesome(ofSize: icon.font.pointSize)
        icon.text = String.fontAwesomeIcon(name: .angleRight)
    }
    
    func setAmount(amount: Double) {
        self.amount.text = "\(amount) Kč"
    }
}
