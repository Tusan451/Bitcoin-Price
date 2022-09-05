//
//  ViewController.swift
//  Bitcoin Price
//
//  Created by Olegio on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {

    let urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
    }
}

