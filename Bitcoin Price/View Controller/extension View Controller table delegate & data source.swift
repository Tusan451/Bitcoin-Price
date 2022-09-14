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
        
        // Проверяем сохраненные значения валют и устанавливаем цвет лэйбла
        let check = checkRates(for: currency, by: currency.code)
        setColorForRateLabel(for: cell, check: check)
        
        // Сохраняем курс валют в UserDefaults
        UserDefaults.standard.set(currency.rate_float, forKey: currency.code)
        
        cell.currency.text = currency.code
        cell.rate.text = currencyRate
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
