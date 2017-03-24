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
    
    func signIn(query: AuthenticationQuery, callback: @escaping(_ successful: Bool, _ response: AuthenticationResponse?) -> Void) {
        
        
        let urlComponents = ServiceConfig.signIn()
        
        // Check well-formed url
        guard let urlSignIn = urlComponents.url else {
            return
        }
        
        // Build request
        var request = URLRequest(url: urlSignIn)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: query.serialize(), options: [])
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Execute api query
        debugPrint(urlSignIn)
        self.session.dataTask(with: request, completionHandler: { data, request, error in
            
            // Check query succeeded
            guard let d = data else {
                print("Error : Sign-in request failed")
                callback(false, nil)
                return
            }
            
            // Trying to parse json response
            if let json = try? JSONSerialization.jsonObject(with: d, options: []) as? [String: Any] {
                
                print("Response")
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
