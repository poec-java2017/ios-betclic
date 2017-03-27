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
        
        self.txUsername.layer.borderWidth = 1
        self.txUsername.layer.cornerRadius = 4.0
        self.txUsername.layer.borderColor = UIColor.lightGray.cgColor
        self.txPassword.layer.borderWidth = 1
        self.txPassword.layer.cornerRadius = 4.0
        self.txPassword.layer.borderColor = UIColor.lightGray.cgColor
        
        // Do any additional setup after loading the view, typically from a nib.
        let publicKey = UserDefaults.standard.string(forKey: "publicKey")
        let privateKey = UserDefaults.standard.string(forKey: "privateKey")
        if (publicKey == "" && privateKey != "") {
            performSegue(withIdentifier: "showEventList", sender: nil)
        }
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
        print("email : " + authenticationQuery.email)
        print("password : " + authenticationQuery.password)
        print("apiKey : " + authenticationQuery.apiKey)
        authenticationService.signIn(query: authenticationQuery, callback: { successful, response in
            if successful {
                if (response!.status == 202) {
                    // Register credentials and segue
                    UserDefaults.standard.set(response!.publicKey, forKey: "publicKey")
                    UserDefaults.standard.set(response!.privateKey, forKey: "privateKey")
                    self.performSegue(withIdentifier: "showEventList", sender: nil)
                } else {
                    // Wrong credentials
                    print("Authentication failed")
                    self.txUsername.layer.borderWidth = 1.0
                    self.txUsername.layer.borderColor = UIColor.red.cgColor
                    self.txPassword.layer.borderWidth = 1.0
                    self.txPassword.layer.borderColor = UIColor.red.cgColor
                    print("Error style setted")
                }
            } else {
                // Query error
                print("Error")
                self.txUsername.layer.borderColor = UIColor.red.cgColor
                self.txPassword.layer.borderColor = UIColor.red.cgColor
            }
        })
    }

}
