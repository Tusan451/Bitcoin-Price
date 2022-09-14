//
//  extension + UserDefaults.swift
//  Bitcoin Price
//
//  Created by Olegio on 14.09.2022.
//

import UIKit

extension ViewController {
    
    // Проверка сохраненных значений валют > <
    func checkRates(for currency: CurrencyData, by key: String) -> Bool? {
        
        guard let savedCurrency = UserDefaults.standard.value(forKey: key) as? Float else { return nil }
        
        var check: Bool
        if currency.rate_float >= savedCurrency {
            check = true
        } else {
            check = false
        }
        return check
    }
    
    // Установка цвета лейбла в зависимости от курса
    func setColorForRateLabel(for cell: CurrencyTableViewCell, check: Bool?) {
        guard let check = check else { return }
        cell.rate.textColor = check ? UIColor.systemGreen : UIColor.systemRed
    }
}
