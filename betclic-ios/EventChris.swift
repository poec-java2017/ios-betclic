//
//  Event.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation

class EventChris {
    var id : String = UUID().uuidString
    var date : Date = Date.init()
    var host : String = ""
    var guest : String = ""
    var league : String = ""
    
    init(date : Date, host : String, guest : String, league : String){
        self.date = date
        self.host = host
        self.guest = guest
        self.league = league
    }
}
