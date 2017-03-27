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
    var ts: Int
    var ctrl: String
    
    init() {
        ts = Int(Date().timeIntervalSince1970)
        ctrl = ServiceConfig.getControl(timestamp: ts)
    }
    
//    func serialize() -> [String: Any] {
      func serialize() -> String {
        let json = [
            "apiKey" : self.apiKey,
            "ts" : self.ts ,
            "ctrl" : self.ctrl
        ] as [String : Any]
        
        return "apiKey=\(self.apiKey)&ts=\(self.ts)&ctrl=\(self.ctrl)"
//        return json
    }
    
}
