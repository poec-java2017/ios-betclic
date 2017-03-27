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
    var message: String? = ""
    var publicKey: String? = ""
    var privateKey: String? = ""
    
    init(json: [String: Any]) {
        self.status = json["status"] as! Int
        self.message = json["message"] as? String
        self.publicKey = json["publicKey"] as? String
        self.privateKey = json["status"] as? String
    }
    
}
