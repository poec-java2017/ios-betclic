//
//  ServiceConfig.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation

class ServiceConfig {
    
    static private let apiScheme = "http"
    static private let apiHost = "m2i.xylphid.net"
    static public let apiKeyPub = "K2ZaSYczA13ppgXetAofyBFk0oJKB7o5"
    static private let apiKeyPriv = "POXTy7dit0WFQ5YtHMEqocsS9xagfoYbFgvFGRXWy3QY1diohZCFu4S1Th8vGbl3rtLB8874t1E5NI27QucZm3MeZS73RmCwv9dH3rS0af63DU2LOzBxxviUDEbeHjTi"
    
    static func signIn() -> URLComponents {
        //let timestamp = Date().timeIntervalSince1970
        
        var urlComponent = URLComponents()
        urlComponent.scheme = self.apiScheme
        urlComponent.host = self.apiHost
        urlComponent.path = "/api/authenticate"
//        urlComponent.queryItems = [
//            URLQueryItem(name: "apiKey", value: self.apiKeyPub),
//            URLQueryItem(name: "ts", value: String(timestamp)),
//            URLQueryItem(name: "ctrl", value: getControl(timestamp: timestamp)),
//            URLQueryItem(name: "email", value: user),
//            URLQueryItem(name: "password", value: password)
//        ]
        
        return urlComponent
    }
    
    // Return control value for api client
    static func getControl(timestamp: Int) -> String {
        let secureString = self.apiKeyPub + self.apiKeyPriv + String(timestamp)
        return secureString.sha1()
    }
    
}

extension String {
    
    /**
     * Return sha1 representation of the current string
     **/
    func sha1() -> String {
        let data = self.data(using: String.Encoding.utf8)!
        var digest = [UInt8](repeating: 0, count:Int(CC_SHA1_DIGEST_LENGTH))
        data.withUnsafeBytes {
            _ = CC_SHA1($0, CC_LONG(data.count), &digest)
        }
        let hexBytes = digest.map { String(format: "%02hhx", $0) }
        return hexBytes.joined()
    }
}
