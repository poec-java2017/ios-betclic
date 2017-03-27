//
//  BetDataProvider.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation

class BetDataProvider{
    
    static func getFakeData()-> [Bet]{
        var bets : [Bet] = []
        
        let event1 = Event(id: 1, nameMatch: "Quart de final Lille-Barca", nameCompetition: "Champion League", nameEquip1: "Lille", nameEquip2: "Barca", coteEquip1: 1, coteEquip2: 1, coteTie: 1, date: MyCalendar.formatDate("26/09/2012T08h30")!, image : "")
        
        let bet1 = Bet(id: 1, nameOwner: "Joséphine baker", option: 0, amount: 12, event: event1)
        bets.append(bet1)
        let bet2 = Bet(id: 2, nameOwner: "Pénélope Fillon", option: 1, amount: 12000, event: event1)
        bets.append(bet2)
        let bet3 = Bet(id: 3, nameOwner: "Jérôme Delaunay", option: 2, amount: 0.12, event: event1)
        bets.append(bet3)
        let bet4 = Bet(id: 4, nameOwner: "Mark zukerberg", option: 1, amount: 56, event: event1)
        bets.append(bet4)
        let bet5 = Bet(id: 5, nameOwner: "Christophe Pamart", option: 0, amount: 150, event: event1)
        bets.append(bet5)
        let bet6 = Bet(id: 6, nameOwner: "Joséphine baker", option: 1, amount: 12, event: event1)
        bets.append(bet6)
        
        return bets
    }
    
}
