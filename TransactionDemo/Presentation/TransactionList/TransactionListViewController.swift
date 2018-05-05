//
//  ViewController.swift
//  TransactionDemo
//
//  Created by Samuel Kodytek on 04/05/2018.
//  Copyright © 2018 Samuel Kodytek. All rights reserved.
//

import UIKit

class TransactionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var transactions: [Transaction] = []
    
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        updateTable()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    @objc private func updateTable() {
        self.transactions = []
        let _ = TransactionManager.shared.getAllTransactions().subscribe(onNext: { (transaction) in
            self.transactions.append(transaction)
        }, onError: { (error) in
            let alert = UIAlertController(title: "Error loading transactions", message: "Error loading transactions. Are you connected to the internet? Try reloading the data.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            self.refreshControl.endRefreshing()
        }, onCompleted: {
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
        }) {
            
        }
    }
    
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(updateTable), for: .valueChanged)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let transaction = transactions[indexPath.row]
        if(transaction.type == .incoming) {
            let cell: IncomingTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "incoming_cell") as! IncomingTableViewCell
            cell.setAmount(amount: transaction.amount)
            return cell
        } else {
            let cell: OutgoingTabelViewCell = self.tableView.dequeueReusableCell(withIdentifier: "outgoing_cell") as! OutgoingTabelViewCell
            cell.setAmount(amount: transaction.amount)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let transaction = transactions[indexPath.row]
        if(transaction.type == .incoming) {
            self.performSegue(withIdentifier: "showIncomingDetail", sender: transaction)
        } else {
            self.performSegue(withIdentifier: "showOutgoingDetail", sender: transaction)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showIncomingDetail") {
            let vc = segue.destination as! IncomingTransactionDetailViewController
            vc.transaction = sender as? Transaction
        } else if(segue.identifier == "showOutgoingDetail") {
            let vc = segue.destination as! OutgoingTransactionDetailViewController
            vc.transaction = sender as? Transaction
        }
    }
}

