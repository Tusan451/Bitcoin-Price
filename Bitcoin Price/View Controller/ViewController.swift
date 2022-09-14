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
    }
    
    // Установка и обновление данных в таблице
    
    private func setupTableView() {
        table.delegate = self
        table.dataSource = self
        
        networkDataFetcher.fetchData(urlString: urlString) { searchResponce in
            guard let searchResponce = searchResponce else { return }
            self.searchResponce = searchResponce
            
            var localDate: String = ""
            guard let date = self.dateFromString(from: searchResponce.time.updatedISO) else { return }
            localDate = self.localDate(from: date)
            
            self.currentDate.text = localDate
            self.currencyesCount()
            
            self.table.reloadData()
        }
    }
}

