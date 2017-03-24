//
//  BaseQuery.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation

class BaseQuery {
    
    let apiKey: String = ServiceConfig.apiKeyPub
    var ts: Double
    var ctrl: String
    
    init() {
        ts = Date().timeIntervalSince1970
        ctrl = ServiceConfig.getControl(timestamp: ts)
    }
 
    func serialize() -> [String: Any] {
        let json = [
            "apiKey" : self.apiKey,
            "ts" : self.ts ,
            "ctrl" : self.ctrl
        ] as [String : Any]
        
        return json
    }
    
}
