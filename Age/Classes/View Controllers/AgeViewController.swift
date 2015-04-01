//
//  ViewController.swift
//  Age
//
//  Created by Julian Grosshauser on 14/03/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import UIKit

public class AgeViewController: UIViewController {

    //MARK: Properties

    var ageLabel = UILabel()

    //MARK: UIViewController

    override public func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        let defaults = NSUserDefaults.standardUserDefaults()

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            let age = ageInPercent(birthday: birthday, today: NSDate())

            self.ageLabel.text = NSString(format: "%.2f", age) as String

            self.ageLabel.sizeToFit()
            self.ageLabel.center = self.view.center
        } else {
            self.presentViewController(BirthdayViewController(), animated: true, completion: nil)
        }
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.ageLabel.textAlignment = NSTextAlignment.Center
        self.ageLabel.layer.borderWidth = 1
        self.ageLabel.layer.borderColor = UIColor.grayColor().CGColor
        self.ageLabel.layer.cornerRadius = 5
        self.view.addSubview(self.ageLabel)
    }

    //MARK: Date Calculations

    public func ageInPercent(#birthday: NSDate, today: NSDate) -> Float {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)

        let currentYear = calendar!.component(NSCalendarUnit.CalendarUnitYear, fromDate: today)
        let birthdayDay = calendar!.component(NSCalendarUnit.CalendarUnitDay, fromDate: birthday)
        let birthdayMonth = calendar!.component(NSCalendarUnit.CalendarUnitMonth, fromDate: birthday)

        let birthdayCurrentYearComponents = NSDateComponents()
        birthdayCurrentYearComponents.day = birthdayDay
        birthdayCurrentYearComponents.month = birthdayMonth
        birthdayCurrentYearComponents.year = currentYear

        let birthdayCurrentYear = calendar!.dateFromComponents(birthdayCurrentYearComponents)!

        var ageInPercent: Float!

        if (calendar!.isDate(birthdayCurrentYear, inSameDayAsDate: today)) {
            let yearDifferenceComponent = calendar?.components(NSCalendarUnit.CalendarUnitYear, fromDate: birthday, toDate: today, options: NSCalendarOptions.allZeros)
            ageInPercent = Float(yearDifferenceComponent!.year)
        }

        return ageInPercent
    }
}

