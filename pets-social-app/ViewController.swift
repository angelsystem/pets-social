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
        var score = PFObject(className: "Score")
        score.setObject("Angel", forKey: "name")
        score.setObject(95, forKey: "number")
        score.saveInBackground()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

