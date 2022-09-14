//
//  extension + Date.swift
//  Bitcoin Price
//
//  Created by Olegio on 14.09.2022.
//

import Foundation

extension ViewController {
    
    // Преобразование строки с сервера в формат Date
    
    func dateFromString(from stringDate: String) -> Date? {
        let localDateFormatter = ISO8601DateFormatter()
        localDateFormatter.timeZone = TimeZone.current
        
        let localDate = localDateFormatter.date(from: stringDate)
        
        return localDate
    }
    
    // Преобразование Date в Ru формат
    
    func localDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.setLocalizedDateFormatFromTemplate("E d MMMM yyyy HH:mm")
        
        return dateFormatter.string(from: date)
    }
}
