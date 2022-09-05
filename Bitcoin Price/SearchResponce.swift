//
//  SearchResponce.swift
//  Bitcoin Price
//
//  Created by Olegio on 05.09.2022.
//

import Foundation

struct SearchResponce: Decodable {
    var time: [Time]
    var bpi: [[Currency]]
}

struct Time: Decodable {
    var updated: String
    var updatedISO: String
    var updateduk: String
}

struct Currency: Decodable {
    var code: String
    var rate_float: Float
}
