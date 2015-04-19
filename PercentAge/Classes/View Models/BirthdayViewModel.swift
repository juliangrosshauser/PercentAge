//
//  BirthdayViewModel.swift
//  PercentAge
//
//  Created by Julian Grosshauser on 09/04/15.
//  Copyright (c) 2015 Julian Grosshauser. All rights reserved.
//

import Foundation

public class BirthdayViewModel: NSObject {

    //MARK: Properties

    static public var observeContext = 0

    dynamic private(set) public var day: Int
    dynamic private(set) public var month: Int
    dynamic private(set) public var year: Int

    //MARK: Initialization

    convenience public override init() {
        let day: Int
        let month: Int
        let year: Int
        let defaults = NSUserDefaults.standardUserDefaults()

        if let birthday = defaults.objectForKey("birthday") as? NSDate {
            let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian) as NSCalendar!
            let birthdayComponents = calendar.components(.CalendarUnitDay | .CalendarUnitMonth | .CalendarUnitYear, fromDate: birthday)

            day = birthdayComponents.day
            month = birthdayComponents.month
            year = birthdayComponents.year
        } else {
            day = 1
            month = 1
            year = 2015
        }

        self.init(day: day, month: month, year: year)
    }

    public init(day: Int, month: Int, year: Int) {
        self.day = day
        self.month = month
        self.year = year
    }

    //MARK: Button Actions

    @objc
    public func incrementDay(sender: AnyObject) {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let dateComponents = NSDateComponents()

        dateComponents.month = self.month
        dateComponents.year = self.year
        let dayRange = calendar.rangeOfUnit(.CalendarUnitDay, inUnit: .CalendarUnitMonth, forDate: calendar.dateFromComponents(dateComponents)!)

        if (self.day == dayRange.length) {
            self.day = 1
        } else {
            self.day++
        }
    }

    @objc
    public func decrementDay(sender: AnyObject) {
        let calendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
        let dateComponents = NSDateComponents()

        dateComponents.month = self.month
        dateComponents.year = self.year
        let dayRange = calendar.rangeOfUnit(.CalendarUnitDay, inUnit: .CalendarUnitMonth, forDate: calendar.dateFromComponents(dateComponents)!)

        if (self.day == 1) {
            self.day = dayRange.length
        } else {
            self.day--
        }
    }

    @objc
    public func incrementMonth(sender: AnyObject) {
        if (self.month == 12) {
            self.month = 1
        } else {
            self.month++
        }
    }

    @objc
    public func decrementMonth(sender: AnyObject) {
        if (self.month == 1) {
            self.month = 12
        } else {
            self.month--
        }
    }

    @objc
    public func incrementYear(sender: AnyObject) {
        if (self.year == 2015) {
            self.year = 1900
        } else {
            self.year++
        }
    }

    @objc
    public func decrementYear(sender: AnyObject) {
        if (self.year == 1900) {
            self.year = 2015
        } else {
            self.year--
        }
    }

    @objc
    public func saveBirthdayIntoUserDefaults(userDefaults: NSUserDefaults) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"

        let day = NSString(format: "%02d", self.day)
        let month = NSString(format: "%02d", self.month)

        let birthday = dateFormatter.dateFromString("\(day)-\(month)-\(self.year)")

        userDefaults.setObject(birthday, forKey: "birthday")
    }
}
