//
//  ViewController.swift
//  pets-social-app
//
//  Created by angelito on 4/11/15.
//  Copyright (c) 2015 Angelito. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        var score = PFObject(className: "Score")
//        score.setObject("Angel", forKey: "name")
//        score.setObject(95, forKey: "number")
//        score.saveInBackground()
        
        var permissions = ["public_profile", "email"]
        PFFacebookUtils.logInInBackgroundWithReadPermissions(permissions, {
            (user: PFUser!, error: NSError!) -> Void in
            println(user)
            if let user = user {
                if user.isNew {
                    println("User signed up and logged in through Facebook!")
                } else {
                    println("User logged in through Facebook!")
                }
            } else {
                println("Uh oh. The user cancelled the Facebook login.")
            }
        })
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

