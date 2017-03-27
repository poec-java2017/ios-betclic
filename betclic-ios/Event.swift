//
//  Event.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation


class Event{
    
    var id : Int = -1
    var nameMatch : String = ""
    var nameCompetition : String = ""
    var nameEquip1 : String = ""
    var nameEquip2 : String = ""
    var coteEquip1 : Float = 1
    var coteEquip2 : Float = 2
    var coteTie : Float = 1
    var date : Date = Date()
    var image : String = ""
    
    init(){}

    init (id : Int, nameMatch : String, nameCompetition : String, nameEquip1 : String, nameEquip2 : String, coteEquip1 : Float, coteEquip2 : Float, coteTie : Float, date : Date, image : String){
        self.id = id
        self.nameMatch = nameMatch
        self.nameCompetition = nameCompetition
        self.nameEquip1 = nameEquip1
        self.nameEquip2 = nameEquip2
        self.coteEquip1 = coteEquip1
        self.coteEquip2 = coteEquip2
        self.coteTie = coteTie
        self.date = date
        self.image = image
    }
}
