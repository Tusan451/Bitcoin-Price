//
//  extension View Controller table delegate & data source.swift
//  Bitcoin Price
//
//  Created by Olegio on 05.09.2022.
//

import Foundation
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CurrencyTableViewCell
        let currency = currencyes[indexPath.row]
        let currencyRate = Int(currency.rate_float)
        
        cell.currency.text = currency.code
        cell.rate.text = String(currencyRate)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
