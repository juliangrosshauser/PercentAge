//
//  ViewController.swift
//  Age
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController {

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            NSLog("Birthday: %@", birthday);
        } else {
            self.presentViewController(BirthdayViewController(), animated: true, completion: nil)
        }
    }
}

