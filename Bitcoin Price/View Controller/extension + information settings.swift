//
//  extension + information settings.swift
//  Bitcoin Price
//
//  Created by Olegio on 14.09.2022.
//

import Foundation

extension ViewController {
    
    // Редактирование отображения курса
    
    func setLabelForRate(for label: CurrencyData) -> String {
        
        var currencyRate = label.rate
        let subrange = ","
        
        if let range = currencyRate.range(of: subrange) {
            currencyRate.replaceSubrange(range, with: ".")
        }
        
        currencyRate.removeLast()
        currencyRate.removeLast()
        
        return currencyRate
    }
    
    // Наполнение массива валют для отображения в таблице
    
    func currencyesCount() {

        guard let usd = searchResponce?.bpi.USD else { return }
        guard let gbp = searchResponce?.bpi.GBP else { return }
        guard let eur = searchResponce?.bpi.EUR else { return }

        currencyes.append(usd)
        currencyes.append(gbp)
        currencyes.append(eur)
    }
}
