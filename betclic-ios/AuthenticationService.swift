//
//  AuthenticationService.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import Foundation
class AuthenticationService {
    
    var session: URLSession = URLSession.shared
    
    func signIn(username:String, password: String, callback: @escaping(_ successful: Bool, _ response: AuthenticationResponse?) -> Void) {
        let urlComponents = ServiceConfig.signIn(user: username, password: password)
        
        // Check well-formed url
        guard let urlSignIn = urlComponents.url else {
            return
        }
        
        let request = NSMutableURLRequest(url: urlSignIn)
        request.httpMethod = "GET"
        
        // Execute api query
        self.session.dataTask(with: urlSignIn, completionHandler: { data, request, error in
            
            // Check query succeeded
            guard let d = data else {
                print("Error : Sign-in request failed")
                callback(false, nil)
                return
            }
            
            // Trying to parse json response
            if let json = try? JSONSerialization.jsonObject(with: d, options: []) as? [String: Any] {
                
                let response = AuthenticationResponse(json: json!)
                // Return response
                callback(true, response)
                
            } else {
                print("Error : AuthenticationResponse data to json dictionnary failed")
                callback(false, nil)
                return
            }
            
        }).resume()
    }
}
