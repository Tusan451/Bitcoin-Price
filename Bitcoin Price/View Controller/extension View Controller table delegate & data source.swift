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
        
        let currencyRate = setLabelForRate(for: currency)
        
        cell.currency.text = currency.code
        cell.rate.text = currencyRate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    // Редактирование отображения курса
    
    private func setLabelForRate(for label: CurrencyData) -> String {
        
        var currencyRate = label.rate
        let subrange = ","
        
        if let range = currencyRate.range(of: subrange) {
            currencyRate.replaceSubrange(range, with: ".")
        }
        
        currencyRate.removeLast()
        currencyRate.removeLast()
        
        return currencyRate
    }
}
