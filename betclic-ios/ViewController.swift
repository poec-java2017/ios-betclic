//
//  ViewController.swift
//  betclic-ios
//
//  Created by Apple on 24/03/2017.
//  Copyright © 2017 Xylphid Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txUsername: UITextField!
    @IBOutlet weak var txPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signIn(_ sender: Any) {
        print("signin")
        let username = txUsername.text!
        let password = txPassword.text!
        
        //guard username.isEmpty || password.isEmpty else {
        let authenticationService = AuthenticationService()
        let authenticationQuery = AuthenticationQuery(email: username, password: password)
            authenticationService.signIn(query: authenticationQuery, callback: { successful, response in
                if successful {
                    // register credentials and segue
                    print("Success")
                } else {
                    // Display error
                    print("Error")
                }
            })
            
            // Stop execution
            //return
        //}
    }

}

