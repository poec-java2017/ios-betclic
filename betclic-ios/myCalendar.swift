//
//  myCalendar.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation


class MyCalendar{
    
    
    static func formatDate(_ dateString: String, format: String = "YY/MM/dd'T'hh:MM") -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.locale = Locale(identifier: "fr_FR")
        return dateFormatter.date(from: dateString)
    }
}
