//
//  EventDataProvider.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation
import UIKit


class EventDataProvider{
    

    
    
    static func getFakeData() -> [Event] {
        
        
        var events : [Event] = []
        
        let event1 = Event(id: 1, nameMatch: "Quart de final Lille-Barca", nameCompetition: "Champion League", nameEquip1: "Lille", nameEquip2: "Barca", coteEquip1: 1, coteEquip2: 1, coteTie: 1, date: MyCalendar.formatDate("26/09/2012T08h30")!, image : "")
        events.append(event1)
        
        
        let event2 = Event(id: 2, nameMatch: "Demi-final PSG-OM", nameCompetition: "Coupe de France", nameEquip1: "PSG", nameEquip2: "OM", coteEquip1: 1, coteEquip2: 1, coteTie: 1, date: MyCalendar.formatDate("12/03/2016T16:00")!, image: "")
        events.append(event2)
        
        let event3 = Event(id: 2, nameMatch: "Qualification Lens-Ajaccio", nameCompetition: "L1", nameEquip1: "Racing club de Lens", nameEquip2: "Ajaccio", coteEquip1: 1, coteEquip2: 1, coteTie: 1, date: MyCalendar.formatDate("12/03/2016T16:00")!, image: "")
        events.append(event3)
        
        return events
    }
    
}
