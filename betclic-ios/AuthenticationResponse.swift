//
//  AuthenticationResponse.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation

class AuthenticationResponse {
    
    var status: Int = 404
    var publicKey: String? = ""
    var privateKey: String? = ""
    
    init(json: [String: Any]) {
        self.status = json["status"] as! Int
        self.publicKey = json["publicKey"] as? String
        self.privateKey = json["status"] as? String
    }
    
}
