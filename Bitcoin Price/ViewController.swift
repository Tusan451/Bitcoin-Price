//
//  ViewController.swift
//  Bitcoin Price
//
//  Created by Olegio on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {

    let urlString = "https://api.coindesk.com/v1/bpi/currentprice.json"
    let networkDataFetcher = NetworkDataFetcher()
    var searchResponce: SearchResponce? = nil
    
    @IBOutlet var table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
    }
    
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
        networkDataFetcher.fetchData(urlString: urlString) { searchResponce in
            guard let searchResponce = searchResponce else { return }
            self.searchResponce = searchResponce
            self.table.reloadData()
            print(searchResponce.time)
            print(searchResponce.bpi.USD)
        }
    }
}

