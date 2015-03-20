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

    var daysBetweenTodayAndBirthdayLabel = UILabel()

    //MARK: UIViewController

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()

        if (defaults.objectForKey("birthday") == nil) {
            self.presentViewController(BirthdayViewController(), animated: true, completion: nil)
        } else {
            let daysBetween = daysBetweenTodayAndBirthday()

            if (daysBetween < 0) {
                self.daysBetweenTodayAndBirthdayLabel.text = "\(abs(self.daysBetweenTodayAndBirthday())) days since your birthday"
            } else {
                self.daysBetweenTodayAndBirthdayLabel.text = "\(self.daysBetweenTodayAndBirthday()) days until your birthday"
            }

            self.daysBetweenTodayAndBirthdayLabel.sizeToFit()
            self.daysBetweenTodayAndBirthdayLabel.center = self.view.center
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.daysBetweenTodayAndBirthdayLabel.textAlignment = NSTextAlignment.Center
        self.daysBetweenTodayAndBirthdayLabel.layer.borderWidth = 1
        self.daysBetweenTodayAndBirthdayLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.daysBetweenTodayAndBirthdayLabel.layer.cornerRadius = 5
        self.view.addSubview(self.daysBetweenTodayAndBirthdayLabel)
    }

    //MARK: Date Calculations

    // will return negative number if birthday already occured in current year
    func daysBetweenTodayAndBirthday() -> Int {
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

