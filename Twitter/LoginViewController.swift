//
//  LoginViewController.swift
//  Twitter
//
//  Created by Christopher Baudouin, Jr. on 11/1/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let transitionSegue = "loginToHome"
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            self.performSegue(withIdentifier: transitionSegue, sender: self)
        }
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let loginEndpoint = "https://api.twitter.com/oauth/request_token"
        let transitionSegue = "loginToHome"
        
        TwitterAPICaller.client?.login(url: loginEndpoint, success: {
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: transitionSegue, sender: self)
            
        }, failure: { (Error) in
            print("Could not log in")
        })
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
