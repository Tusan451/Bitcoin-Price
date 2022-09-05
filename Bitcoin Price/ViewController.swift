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
    var currencyes: [CurrencyData] = []
    
    @IBOutlet var table: UITableView!
    @IBOutlet var currentDate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
//        currencyesCount()
    }
    
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
        networkDataFetcher.fetchData(urlString: urlString) { searchResponce in
            guard let searchResponce = searchResponce else { return }
            self.searchResponce = searchResponce
            
            self.currentDate.text = searchResponce.time.updated
            self.currencyesCount()
            
            self.table.reloadData()
            
            print(searchResponce.time)
            print(searchResponce.bpi.USD!)
            print(self.currencyes.count)
        }
    }
    
    private func currencyesCount() {

        guard let usd = searchResponce?.bpi.USD else { return }
        guard let gbp = searchResponce?.bpi.GBP else { return }
        guard let eur = searchResponce?.bpi.EUR else { return }

        currencyes.append(usd)
        currencyes.append(gbp)
        currencyes.append(eur)
    }
}

