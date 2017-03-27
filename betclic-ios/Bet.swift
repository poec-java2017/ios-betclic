//
//  Bet.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation

class Bet{
    
    var id : Int = -1
    var nameOwner : String = ""
    /**
    * 0 tie, 1 equip 1 win, 2 equip 2 win
    **/
    var option : Int = 0
    var quotation : Float = 1
    var amount: Float = 0
    var date: Date = Date()
    var event : Event = Event()
    
    init(id: Int, nameOwner: String, option: Int, amount: Float, event: Event){
        self.nameOwner = nameOwner
        self.option = option
        self.amount = amount
        switch option {
        case 1 :
            self.quotation = event.coteEquip1
        case 2 :
            self.quotation = event.coteEquip2
        default :
            self.quotation = event.coteTie
        }
        self.event = event
    }
}
