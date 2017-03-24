//
//  AuthenticationQuery.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation

class AuthenticationQuery: BaseQuery {
    
    var email:String = ""
    var password: String = ""
    
    init(email: String, password: String) {
        super.init()
        self.email = email
        self.password = password
    }
    
    override func serialize() -> [String: Any] {
        var json: [String: Any] = super.serialize()
        json["email"] = self.email
        json["password"] = self.password
        
        return json
    }
}
