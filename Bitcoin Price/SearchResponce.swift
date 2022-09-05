//
//  SearchResponce.swift
//  Bitcoin Price
//
//  Created by Olegio on 05.09.2022.
//

import Foundation

struct SearchResponce: Codable {
    var time: Time
    var bpi: Currency
}

struct Time: Codable {
    var updated: String
    var updatedISO: String
    var updateduk: String
}

struct Currency: Codable {
    var USD: CurrencyData
    var GBP: CurrencyData
    var EUR: CurrencyData
}

struct CurrencyData: Codable {
    var code: String
    var rate_float: Float
}
