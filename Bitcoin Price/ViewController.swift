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
    
    // Наполнение массива валют для отображения в таблице
    
    private func currencyesCount() {

        guard let usd = searchResponce?.bpi.USD else { return }
        guard let gbp = searchResponce?.bpi.GBP else { return }
        guard let eur = searchResponce?.bpi.EUR else { return }

        currencyes.append(usd)
        currencyes.append(gbp)
        currencyes.append(eur)
    }
    
    // Преобразование строки с сервера в формат Date
    
    private func dateFromString(from stringDate: String) -> Date? {
        let localDateFormatter = ISO8601DateFormatter()
        localDateFormatter.timeZone = TimeZone.current
        
        let localDate = localDateFormatter.date(from: stringDate)
        
        return localDate
    }
    
    // Преобразование Date в Ru формат
    
    private func localDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("E d MMMM yyyy HH:mm")
        
        return dateFormatter.string(from: date)
    }
}

