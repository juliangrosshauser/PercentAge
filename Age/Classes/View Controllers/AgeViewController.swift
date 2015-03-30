//
//  ViewController.swift
//  Age
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

class AgeViewController: UIViewController {

    //MARK: Properties

    var ageLabel = UILabel()

    //MARK: UIViewController

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()

        if (defaults.objectForKey("birthday") == nil) {
            self.presentViewController(BirthdayViewController(), animated: true, completion: nil)
        } else {
            let age = ageInPercent()

            self.ageLabel.text = NSString(format: "%.2f", age) as String

            self.ageLabel.sizeToFit()
            self.ageLabel.center = self.view.center
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.ageLabel.textAlignment = NSTextAlignment.Center
        self.ageLabel.layer.borderWidth = 1
        self.ageLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.ageLabel.layer.cornerRadius = 5
        self.view.addSubview(self.ageLabel)
    }

    //MARK: Date Calculations

    // will return negative number if birthday already occured in current year
    func ageInPercent() -> Float {
        let defaults = NSUserDefaults.standardUserDefaults()

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
            let today = NSDate()

            let currentYear = calendar!.component(NSCalendarUnit.CalendarUnitYear, fromDate: today)
            let birthdayDay = calendar!.component(NSCalendarUnit.CalendarUnitDay, fromDate: birthday)
            let birthdayMonth = calendar!.component(NSCalendarUnit.CalendarUnitMonth, fromDate: birthday)

            let birthdayCurrentYearComponents = NSDateComponents()
            birthdayCurrentYearComponents.day = birthdayDay
            birthdayCurrentYearComponents.month = birthdayMonth
            birthdayCurrentYearComponents.year = currentYear

            let birthdayCurrentYear = calendar!.dateFromComponents(birthdayCurrentYearComponents)!

            let dayDifference = calendar!.components(NSCalendarUnit.CalendarUnitDay, fromDate: today, toDate: birthdayCurrentYear, options: nil)

            // if birthdayCurrentYear is before today dayDifference.day will return a negative number
            return dayDifference.day
        }

        return 0
    }
}

